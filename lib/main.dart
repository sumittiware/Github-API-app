import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanmatch_task/app/app.dart';
import 'package:urbanmatch_task/app/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppState()),
      ],
      child: MaterialApp(
        title: 'Github API Demo',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: Colors.blue,
        ),
        home: const App(),
      ),
    );
  }
}
