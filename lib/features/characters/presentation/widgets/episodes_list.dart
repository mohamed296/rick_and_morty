import 'package:flutter/material.dart';

class EpisodesList extends StatelessWidget {
  final List<String> episodes;

  const EpisodesList({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '${episodes.length} Episodes',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
          ),
        ),
        ...episodes.map((episodeUrl) {
          final episodeId = episodeUrl.split('/').last;
          return ListTile(
            tileColor: Colors.grey.withOpacity(0.05),
            title: Text('Episode $episodeId'),
            leading: const Icon(Icons.tv),
            trailing: const Icon(Icons.chevron_right),
          );
        }),
      ],
    );
  }
}
