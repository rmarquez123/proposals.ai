import 'package:flutter/material.dart';
import 'package:proposals/screens/home_screen/active_proposals/active_proposals_panel.dart';
import 'package:proposals/screens/home_screen/past_proposals/past_proposals_panel.dart';
import 'package:proposals/widgets/upload_files.dart';

class MainPanel extends StatelessWidget {
  const MainPanel({super.key});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back, Ricardo',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ActiveProposals(),
                    const SizedBox(height: 20),
                    const PastProposalsPanel(),
                    const SizedBox(height: 20),
                    UploadFiles(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
