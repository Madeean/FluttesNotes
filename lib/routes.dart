import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screens/edit_note/edit_note_screen.dart';
import 'package:flutter_demo/screens/list_notes/list_notes_cubit.dart';
import 'package:flutter_demo/screens/list_notes/list_notes_screen.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';
import 'package:flutter_demo/screens/note_detail/note_detail_screen.dart';

Route<dynamic>? mainRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.route:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case NoteDetailScreen.route:
      var cubit =
          (settings.arguments as Map<String, dynamic>)['cubit']
              as ListNotesCubit;
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider.value(
              value: cubit,
              child: Scaffold(body: NoteDetailScreen()),
            ),
      );
    case EditNoteScreen.route:
      var cubit =
          (settings.arguments as Map<String, dynamic>)['cubit']
              as ListNotesCubit;
      var isAddMode =
          (settings.arguments as Map<String, dynamic>)['isAddMode'] ?? false;
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider.value(
              value: cubit,
              child: Scaffold(body: EditNoteScreen(isAddMode: isAddMode)),
            ),
      );
    case ListNotesScreen.route:
      return MaterialPageRoute(builder: (context) => ListNotesScreen());
    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
