import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../list_notes/list_notes_cubit.dart';

class EditNoteScreen extends StatelessWidget {
  static const String route = 'EditNoteScreen';
  final isAddMode;

  const EditNoteScreen({super.key, this.isAddMode = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNotesCubit, ListNotesState>(
      builder: (context, state) {
        TextEditingController _title = TextEditingController(
          text: isAddMode ? '' : state.notes[state.selectedIdx].title,
        );
        TextEditingController _content = TextEditingController(
          text: isAddMode ? '' : state.notes[state.selectedIdx].content,
        );

        return Container(
          child: Column(
            children: [
              TextField(controller: _title),
              SizedBox(height: 16),
              TextField(controller: _content),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (isAddMode) {
                    context.read<ListNotesCubit>().addNote(
                      _title.text,
                      _content.text,
                    );
                  } else {
                    context.read<ListNotesCubit>().editIndex(
                      state.selectedIdx,
                      _title.text,
                      _content.text,
                    );
                  }
                  if (isAddMode) {
                    Navigator.pop(context);
                    return;
                  }
                  if (state.pageCount < 3) {
                    Navigator.pop(context);
                    return;
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }
}
