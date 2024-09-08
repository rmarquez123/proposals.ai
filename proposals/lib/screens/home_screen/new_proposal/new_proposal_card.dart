import 'package:flutter/material.dart';

class NewProposalCard extends StatelessWidget {
  /**
   * 
   */
  const NewProposalCard({super.key});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: theme.primaryColor, // Use primary color from theme
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.build_circle, size: 48, color: theme.colorScheme.secondary), // Use secondary color from theme
              const SizedBox(height: 16),
              Text(
                'Work On A New Proposal',
                style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Or Refine Existing Proposal',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary, // Use secondary color from theme
                  foregroundColor: Colors.white, // Text color
                ),
                onPressed: () {},
                child: const Text('Upload an RFP or Proposal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
