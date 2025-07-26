import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screens/edit_note/edit_note_screen.dart';
import 'package:flutter_demo/screens/list_notes/list_notes_cubit.dart';

class NoteDetailScreen extends StatelessWidget {
  static const String route = 'NoteDetailScreen';

  const NoteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNotesCubit, ListNotesState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Text(
                '${state.notes[state.selectedIdx].dateTime.toIso8601String()}',
              ),
              SizedBox(height: 16),
              Text('${state.notes[state.selectedIdx].title}'),
              SizedBox(height: 16),
              Text('${state.notes[state.selectedIdx].content}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (state.pageCount < 3) {
                    Navigator.of(context).pushNamed(
                      EditNoteScreen.route,
                      arguments: {'cubit': context.read<ListNotesCubit>()},
                    );
                  }
                },
                child: Text("Edit"),
              ),
            ],
          ),
        );
      },
    );
  }
}
