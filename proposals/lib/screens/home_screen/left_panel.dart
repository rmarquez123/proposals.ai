import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      color: theme.primaryColor, // Use primary color from theme
      child: Column(
        children: [
          IconButton(
              icon: const Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {}),
        ],
      ),
    );
  }
}
