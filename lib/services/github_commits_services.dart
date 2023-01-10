import 'package:urbanmatch_task/models/github_commit.dart';
import 'package:urbanmatch_task/utils/request.dart';
import 'package:urbanmatch_task/utils/request_exception.dart';

class GithubCommitsServices {
  final _serverRequest = ServerRequest();

  Future<List<GithubCommits>> fetchRepositoryCommits(String repoName) async {
    try {
      final data = await _serverRequest.get(
        path: 'repos/$repoName/commits',
      );

      List<GithubCommits> githubCommits = [];

      for (var ele in data) {
        githubCommits.add(
          GithubCommits.fromJson(ele),
        );
      }

      return githubCommits;
    } on RequestException catch (_) {
      print('${_.message}');
    }
    return [];
  }
}
