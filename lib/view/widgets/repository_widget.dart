import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urbanmatch_task/models/github_repository.dart';
import 'package:urbanmatch_task/style/colors.dart';
import 'package:urbanmatch_task/view/repository_detail.dart';

class RepositoryWidget extends StatefulWidget {
  final GithubRepository repository;
  final bool allowTap;
  const RepositoryWidget({
    super.key,
    required this.repository,
    required this.allowTap,
  });

  @override
  State<RepositoryWidget> createState() => _RepositoryWidgetState();
}

class _RepositoryWidgetState extends State<RepositoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.allowTap) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => RepositoryDetailScreen(repo: widget.repository),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildDescription(),
            _buildForked(),
            _buildTags(),
            _buildStats(),
            _buildUpdatedTime(),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.repository.name!,
      style: const TextStyle(
        color: blue,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildDescription() {
    if (widget.repository.description == null) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        widget.repository.description!,
        style: const TextStyle(
          color: grey,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildForked() {
    if (!widget.repository.fork!) {
      return Container();
    }
    final forkUrl = widget.repository.forksUrl!;
    return Text('Forked from $forkUrl');
  }

  Widget _buildTags() {
    final tags = widget.repository.topics;
    if (tags == null) {
      return Container();
    }
    return Wrap(
      children: List.generate(
        tags.length,
        (index) => _buildTag(tags[index]),
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildLanguage(),
          _buildForks(),
          _buildStarGazzers(),
        ],
      ),
    );
  }

  Widget _buildLanguage() {
    if (widget.repository.language == null) {
      return Container();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.code,
          color: grey,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          widget.repository.language!,
          style: const TextStyle(
            color: grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildUpdatedTime() {
    final date = widget.repository.updatedAt!;
    final dateTime = DateTime.parse(date);
    final formattedDate = DateFormat.yMMMEd().format(dateTime);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        'Updated at $formattedDate',
        style: const TextStyle(
          color: grey,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildForks() {
    int forksCount = widget.repository.forksCount ?? 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.fork_right_rounded,
          color: grey,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          forksCount.toString(),
          style: const TextStyle(color: grey, fontSize: 12),
        )
      ],
    );
  }

  Widget _buildStarGazzers() {
    int starGazzersCount = widget.repository.stargazersCount ?? 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star_border_purple500_rounded,
          color: grey,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          starGazzersCount.toString(),
          style: const TextStyle(
            color: grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: blue.withOpacity(0.4),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: blue,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: grey,
      thickness: 0.5,
      indent: 0,
      endIndent: 0,
    );
  }
}
