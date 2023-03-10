import 'package:flutter/material.dart';
import 'package:urbanmatch_task/models/github_commit.dart';
import 'package:urbanmatch_task/models/github_repository.dart';
import 'package:urbanmatch_task/services/github_commits_services.dart';
import 'package:urbanmatch_task/services/github_repository_services.dart';

// State of the entire app will be managed by this Provider
class AppState with ChangeNotifier {
  bool loadingRepos = false;

  List<GithubRepository> _repos = [];

  List<GithubRepository> get repositories => _repos;

  setLoadingRepos(bool value) {
    loadingRepos = value;
    notifyListeners();
  }

  Future<void> fetchGithubRepositories() async {
    try {
      setLoadingRepos(true);
      // Fetching all the public repos
      _repos = await GithubRepositorySevices().fetchGithubRepositories();
      // async background call to fetch all the commits for all the public repos
      fetchAllGithubCommits();
      setLoadingRepos(false);
    } catch (_) {}
  }

  Future<void> fetchAllGithubCommits() async {
    try {
      for (int i = 0; i < _repos.length; i++) {
        final repo = _repos[i];
        repo.commits = await GithubCommitsServices()
            .fetchRepositoryCommits(repo.fullName!);
        print('Fetched $i lenght : ${repo.commits!.length}');
        _repos[i] = repo;
        notifyListeners();
      }
    } catch (_) {}
  }

  // Check if the commits for repo with provided id is fetched or not
  bool isCommitsFetched(int id) {
    final commits = _repos.firstWhere((element) => element.id == id).commits;
    if (commits == null) {
      return false;
    }
    return true;
  }

  // get all commits for repo with given id
  List<GithubCommits> getCommits(int id) {
    return _repos.firstWhere((element) => element.id == id).commits!;
  }
}
