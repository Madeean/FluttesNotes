import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screens/edit_note/edit_note_screen.dart';
import 'package:flutter_demo/screens/list_notes/list_notes_cubit.dart';
import 'package:flutter_demo/screens/note_detail/note_detail_screen.dart';

class ListNotesScreen extends StatelessWidget {
  static const String route = 'ListNotes';

  const ListNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ListNotesCubit(), child: Page());
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    print('width: ${width}');
    int pageCount = 0;
    if (width <= 600) {
      pageCount = 1;
    } else if (width <= 900) {
      pageCount = 2;
    } else {
      pageCount = 3;
    }
    context.read<ListNotesCubit>().setPageCount(pageCount);
    return Scaffold(
      body: switch (pageCount) {
        == 1 => ListNotesPage(),
        == 2 => ListNotesWithDetailPage(),
        == 3 => ListNotesDetailEditPage(),
        _ => ListNotesPage(),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditNoteScreen.route,
            arguments: {
              'cubit': context.read<ListNotesCubit>(),
              'isAddMode': true,
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListNotesPage extends StatelessWidget {
  const ListNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNotesCubit, ListNotesState>(
      builder: (context, state) {
        final cubit = context.read<ListNotesCubit>();
        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              var item = state.notes[index];
              return Card(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: ListTile(
                  onTap: () {
                    cubit.setSelectedIdc(index);
                    if (state.pageCount == 1) {
                      Navigator.pushNamed(
                        context,
                        NoteDetailScreen.route,
                        arguments: {'cubit': cubit},
                      );
                    }
                  },
                  title: Text(item.title),
                  subtitle: Text(item.dateTime.toString()),
                  trailing: IconButton(
                    onPressed: () {
                      cubit.removeNote(index);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
            itemCount: state.notes.length,
          ),
        );
      },
    );
  }
}

class ListNotesWithDetailPage extends StatelessWidget {
  const ListNotesWithDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: ListNotesPage()),
          Expanded(child: NoteDetailScreen()),
        ],
      ),
    );
  }
}

class ListNotesDetailEditPage extends StatelessWidget {
  const ListNotesDetailEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: ListNotesPage()),
          Expanded(child: NoteDetailScreen()),
          Expanded(child: EditNoteScreen()),
        ],
      ),
    );
  }
}
