// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';

class RecommendedRfpCard extends StatelessWidget {
  final String title;
  final String date;

  const RecommendedRfpCard({super.key, required this.title, required this.date});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: theme.primaryColor, // Use primary color from theme
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.description, size: 40, color: theme.colorScheme.secondary), // Use secondary color from theme
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    date,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
