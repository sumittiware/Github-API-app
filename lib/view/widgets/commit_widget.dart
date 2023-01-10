import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urbanmatch_task/models/github_commit.dart';
import 'package:urbanmatch_task/style/colors.dart';

class CommitsWidget extends StatefulWidget {
  final GithubCommits commit;

  const CommitsWidget({
    super.key,
    required this.commit,
  });

  @override
  State<CommitsWidget> createState() => _CommitsWidgetState();
}

class _CommitsWidgetState extends State<CommitsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTitle(),
              ),
              _buildVerificationSymbol(),
            ],
          ),
          _buildCommiter(),
          _buildCommitedTime(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.commit.commit!.message!,
      style: const TextStyle(
        color: blue,
        fontSize: 16,
      ),
    );
  }

  Widget _buildVerificationSymbol() {
    final commit = widget.commit.commit;
    if (commit != null &&
        commit.verification != null &&
        commit.verification!.verified != null &&
        !commit.verification!.verified!) {
      return Container();
    }
    return const Icon(
      Icons.verified,
      color: green,
      size: 18,
    );
  }

  Widget _buildCommiter() {
    final commiter = widget.commit.author;
    final commiterName = widget.commit.commit!.author!.name;
    if (commiter == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (commiter.avatarUrl != null)
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(commiter.avatarUrl!),
            ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '$commiterName',
            style: const TextStyle(
              color: grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommitedTime() {
    final date = widget.commit.commit!.author!.date!;
    final dateTime = DateTime.parse(date);
    final formattedDate = DateFormat.yMMMEd().format(dateTime);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        'Commited at $formattedDate',
        style: const TextStyle(
          color: grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
