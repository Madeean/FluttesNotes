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
    return Scaffold(
      body: switch (pageCount) {
        == 1 => ListNotesPage(),
        == 2 => ListNotesWithDetailPage(),
        == 3 => ListNotesDetailEditPage(),
        _ => ListNotesPage(),
      },
    );
  }
}

class ListNotesPage extends StatelessWidget {
  const ListNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNotesCubit, ListNotesState>(
      builder: (context, state) {

        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text("$index");
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
