import 'package:urbanmatch_task/models/github_author.dart';

class GithubCommits {
  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  GithubAuthor? author;
  List<Parents>? parents;

  GithubCommits({
    this.sha,
    this.nodeId,
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.parents,
  });

  GithubCommits.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author =
        json['author'] != null ? GithubAuthor.fromJson(json['author']) : null;

    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sha'] = sha;
    data['node_id'] = nodeId;
    if (commit != null) {
      data['commit'] = commit!.toJson();
    }
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['comments_url'] = commentsUrl;
    data['author'] = author;
    if (parents != null) {
      data['parents'] = parents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commit {
  Author? author;
  Author? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  Commit({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  Commit.fromJson(Map<String, dynamic> json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    committer =
        json['committer'] != null ? Author.fromJson(json['committer']) : null;
    message = json['message'];
    tree = json['tree'] != null ? Tree.fromJson(json['tree']) : null;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    data['message'] = message;
    if (tree != null) {
      data['tree'] = tree!.toJson();
    }
    data['url'] = url;
    data['comment_count'] = commentCount;
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    return data;
  }
}

class Author {
  String? name;
  String? email;
  String? date;

  Author({
    this.name,
    this.email,
    this.date,
  });

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['date'] = date;
    return data;
  }
}

class Tree {
  String? sha;
  String? url;

  Tree({this.sha, this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sha'] = sha;
    data['url'] = url;
    return data;
  }
}

class Verification {
  bool? verified;
  String? reason;
  String? signature;
  String? payload;

  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
    signature = json['signature'].toString();
    payload = json['payload'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['verified'] = verified;
    data['reason'] = reason;
    data['signature'] = signature;
    data['payload'] = payload;
    return data;
  }
}

class Parents {
  String? sha;
  String? url;
  String? htmlUrl;

  Parents({this.sha, this.url, this.htmlUrl});

  Parents.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sha'] = sha;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    return data;
  }
}
