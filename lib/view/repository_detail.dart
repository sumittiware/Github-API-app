import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:urbanmatch_task/app/app_state.dart';
import 'package:urbanmatch_task/models/github_repository.dart';
import 'package:urbanmatch_task/style/colors.dart';
import 'package:urbanmatch_task/view/widgets/commit_widget.dart';
import 'package:urbanmatch_task/view/widgets/repository_widget.dart';

class RepositoryDetailScreen extends StatefulWidget {
  final GithubRepository repo;

  const RepositoryDetailScreen({super.key, required this.repo});

  @override
  State<RepositoryDetailScreen> createState() => _RepositoryDetailScreenState();
}

class _RepositoryDetailScreenState extends State<RepositoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Commits'),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        RepositoryWidget(
          repository: widget.repo,
          allowTap: false,
        ),
        Expanded(
          child: _buildRepoCommits(),
        )
      ],
    );
  }

  Widget _buildRepoCommits() {
    return Consumer<AppState>(
      builder: (_, appState, __) {
        final commits = appState.getCommits(widget.repo.id!);
        return (!appState.isCommitsFetched(widget.repo.id!))
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Timeline.tileBuilder(
                physics: const BouncingScrollPhysics(),
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: green,
                ),
                shrinkWrap: true,
                builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.basic,
                  contentsBuilder: (context, index) =>
                      CommitsWidget(commit: commits[index]),
                  itemCount: commits.length,
                ),
              );
      },
    );
  }
}
