import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanmatch_task/app/app_state.dart';
import 'package:urbanmatch_task/style/colors.dart';
import 'package:urbanmatch_task/view/widgets/repository_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.fetchGithubRepositories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: black,
      title: const Text(
        'Github API',
        style: TextStyle(color: white),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Consumer<AppState>(
      builder: (_, appState, __) {
        final repos = appState.repositories;
        return (appState.loadingRepos)
            ? const Center(
                child: CircularProgressIndicator(
                  color: blue,
                ),
              )
            : ListView.builder(
                itemBuilder: (_, index) {
                  return RepositoryWidget(
                    repository: repos[index],
                    allowTap: true,
                  );
                },
                itemCount: repos.length,
              );
      },
    );
  }
}
