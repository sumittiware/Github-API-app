import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanmatch_task/app/app_state.dart';
import 'package:urbanmatch_task/style/theme.dart';
import 'package:urbanmatch_task/view/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // Root of the application
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Github API Demo',
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
