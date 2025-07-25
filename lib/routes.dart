import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/edit_note/edit_note_screen.dart';
import 'package:flutter_demo/screens/list_notes/list_notes_screen.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';
import 'package:flutter_demo/screens/note_detail/note_detail_screen.dart';

Route<dynamic>? mainRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.route:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case NoteDetailScreen.route:
      return MaterialPageRoute(builder: (context) => NoteDetailScreen());
    case EditNoteScreen.route:
      return MaterialPageRoute(builder: (context) => EditNoteScreen());
    case ListNotesScreen.route:
      return MaterialPageRoute(builder: (context) => ListNotesScreen());
    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
