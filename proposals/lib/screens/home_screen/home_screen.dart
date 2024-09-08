import 'package:flutter/material.dart';
import 'package:proposals/screens/home_screen/left_panel.dart';
import 'package:proposals/screens/home_screen/main_panel.dart';
import 'package:proposals/screens/home_screen/right_panel.dart';
import 'package:proposals/screens/new_rfp_setup/start_proposal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'PROPOSAL AI',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StartProposalScreen()),
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 5),
                  Text('NEW PROPOSAL'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Row(
        children: [
          LeftPanel(),
          MainPanel(),
          RightPanel(),
        ],
      ),
    );
  }
}
