import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/routes.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.mouse,
        },
      ),
      onGenerateRoute: mainRoute,
      initialRoute: LoginScreen.route,
      home: SafeArea(child: Scaffold(body: Center())),
    );
  }
}

// class TabBarBody extends StatelessWidget {
//   const TabBarBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Tab"),
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.home)),
//               Tab(icon: Icon(Icons.settings)),
//             ],
//           ),
//         ),
//         body: Container(
//           child: TabBarView(children: [FirstTabScreen(), SecondTabScreen()]),
//         ),
//       ),
//     );
//   }
// }
//
// class FirstTabScreen extends StatelessWidget {
//   const FirstTabScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Text("FirstTabScreen"));
//   }
// }
//
// class SecondTabScreen extends StatelessWidget {
//   const SecondTabScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Text("SecondTabScreen"));
//   }
// }
//
// class MediaQueryBody extends StatelessWidget {
//   const MediaQueryBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     print(
//       "screen info: ${MediaQuery.of(context).devicePixelRatio}, ${MediaQuery.of(context).textScaler}",
//     );
//     return Container(
//       width: 300,
//       height: 300,
//       color: Colors.orange,
//       child: Column(
//         children: [
//           Text("hi ios"),
//           CupertinoButton(child: Text("ios Button"), onPressed: () {}),
//           ElevatedButton(onPressed: () {}, child: Text("android btn")),
//         ],
//       ),
//     );
//   }
// }
