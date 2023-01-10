import 'package:urbanmatch_task/const.dart';
import 'package:urbanmatch_task/models/github_repository.dart';
import 'package:urbanmatch_task/utils/request.dart';
import 'package:urbanmatch_task/utils/request_exception.dart';

class GithubRepositorySevices {
  final _serverRequest = ServerRequest();

  Future<List<GithubRepository>> fetchGithubRepositories() async {
    try {
      final data = await _serverRequest.get(
        path: 'users/$repoName/repos',
      );

      List<GithubRepository> publicRepos = [];

      for (var ele in data) {
        publicRepos.add(
          GithubRepository.fromJson(ele),
        );
      }

      return publicRepos;
    } on RequestException catch (_) {
      print(_.message);
    }
    return [];
  }
}
