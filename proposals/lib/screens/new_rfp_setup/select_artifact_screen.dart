import 'package:flutter/material.dart';
import 'package:proposals/screens/editor/proposal_editor/proposal_editor_screen.dart';

class SelectArtifactScreen extends StatefulWidget {
  @override
  _SelectArtifactScreenState createState() => _SelectArtifactScreenState();
}

class _SelectArtifactScreenState extends State<SelectArtifactScreen> {
  // Variable to keep track of the selected card
  String selectedArtifact = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColorLight,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: theme.primaryColorDark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Which proposal artifact do you want to generate first?",
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3.5,
                children: [
                  _artifactCard(
                    'Proposal',
                    'Generate the proposal using the RFP, past projects & knowledge.',
                    Colors.purple,
                    theme,
                  ),
                  _artifactCard(
                    "Team's Resumes and CVs",
                    'Generate new resumes for your team tailored to the RFP.',
                    Colors.teal,
                    theme,
                  ),
                  _artifactCard(
                    'Budget',
                    'Generate new budget tailored to the RFP and past budgets.',
                    Colors.red,
                    theme,
                  ),
                  _artifactCard(
                    'Schedule',
                    'Generate new schedule tailored to the RFP and past schedule.',
                    Colors.blue,
                    theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.secondary, // Button color
                foregroundColor: Colors.white, // Text color
              ),
              onPressed: selectedArtifact.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProposalEditorScreen()),
                      );
                      // Handle the generate draft action here
                      print("Selected Artifact: $selectedArtifact");
                    },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Text('GENERATE DRAFT'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _artifactCard(String title, String subtitle, Color color, ThemeData theme) {
    bool isSelected = selectedArtifact == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedArtifact = '';
          } else {
            selectedArtifact = title;
          }
        });
      },
      child: Container(
        height: 60, // Set the desired height here
        child: Card(
          color: isSelected
              ? color.withOpacity(0.3)
              : theme.colorScheme.secondary.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: color,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
