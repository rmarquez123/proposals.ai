import 'package:flutter/material.dart';
import 'package:proposals/screens/new_rfp_setup/include_projects_screen.dart';

class IncludeCVScreen extends StatelessWidget {
  const IncludeCVScreen({super.key});

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
              "Resumes and CVs of Team to be included in Proposal",
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVs on your Repository',
                            style: theme.textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          _cvItem('Elizabeth Anne Johnson', '17 Jul',
                              theme.colorScheme.secondary),
                          _cvItem('Michael Robert Thompson', '30 Jul',
                              Colors.green),
                          _cvItem(
                              'Samantha Jane Martinez', '1 Aug', Colors.orange),
                          _cvItem(
                              'Christopher David Brown', '15 Aug', Colors.red),
                          _cvItem(
                              'Jessica Marie Wilson', '15 Aug', Colors.brown),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.upload_file,
                              size: 48, color: theme.colorScheme.secondary),
                          const SizedBox(height: 16),
                          Text(
                            'Drag and drop CVs, or Browse',
                            style: theme.textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Support pdf and docx files',
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.folder, size: 32, color: Colors.blue),
                              SizedBox(width: 16),
                              Icon(Icons.folder, size: 32, color: Colors.green),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Connect and sync from a folder',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'Click to skip if you have all the CVs already on your Repository',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.secondary, // Button color
                foregroundColor: Colors.white, // Text color
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IncludeProjectsScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Text('NEXT STEP (3/5)'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _cvItem(String name, String date, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.person, size: 24, color: iconColor),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
