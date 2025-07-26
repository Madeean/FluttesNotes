import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screens/testing/TestingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(
      'onTransition  -- bloc: ${bloc.runtimeType}, transition: $transition',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}

void main() async {
  // Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    BlocProvider(
      create: (context) => CounterCubit(sharedPreferences),
      child: MaterialApp(home: SafeArea(child: Testingscreen())),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       scrollBehavior: MaterialScrollBehavior().copyWith(
//         dragDevices: {
//           PointerDeviceKind.touch,
//           PointerDeviceKind.trackpad,
//           PointerDeviceKind.mouse,
//         },
//       ),
//       onGenerateRoute: mainRoute,
//       initialRoute: Testingscreen.route,
//       home: SafeArea(child: Scaffold(body: Center())),
//     );
//   }
// }

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
