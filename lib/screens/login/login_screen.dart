import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/list_notes/list_notes_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Username')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ListNotesScreen.route);
              },
              child: Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
