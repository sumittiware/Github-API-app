import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanmatch_task/app/app.dart';
import 'package:urbanmatch_task/app/app_state.dart';
import 'package:urbanmatch_task/style/colors.dart';
import 'package:urbanmatch_task/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Github API Demo',
        theme: AppTheme.darkTheme,
        home: const App(),
      ),
    );
  }
}
