import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanmatch_task/app/app_state.dart';
import 'package:urbanmatch_task/const.dart';
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
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        '$repoName ',
        style: TextStyle(color: white),
      ),
      actions: [
        Consumer<AppState>(
          builder: (_, appState, __) {
            int totalRepos = appState.repositories.length;
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  'Repositories ($totalRepos)',
                  style: const TextStyle(color: white),
                ),
              ),
            );
          },
        ),
      ],
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
