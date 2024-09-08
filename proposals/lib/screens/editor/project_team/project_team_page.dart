import 'package:flutter/material.dart';

class ProjectTeamPage extends StatefulWidget {
  const ProjectTeamPage({super.key});

  @override
  State<ProjectTeamPage> createState() => _ProjectTeamPageState();
}

class _ProjectTeamPageState extends State<ProjectTeamPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project Team Member",
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search by name or email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add by name or invite by email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.person_add),
                    const SizedBox(width: 8),
                    Text("Invite", style: theme.textTheme.labelSmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Avatar', style: theme.textTheme.titleSmall)),
                  DataColumn(label: Text('Name', style: theme.textTheme.titleSmall)),
                  DataColumn(label: Text('Email', style: theme.textTheme.titleSmall)),
                  DataColumn(label: Text('Status', style: theme.textTheme.titleSmall)),
                  DataColumn(label: Text('Role', style: theme.textTheme.titleSmall)),
                  DataColumn(label: Text('Last Active', style: theme.textTheme.titleSmall)),
                ],
                rows: [
                  _buildTeamMember(
                    initials: "MD",
                    name: "Mark Diamond",
                    email: "diamond@avocado.com",
                    status: "Active",
                    role: "Manager",
                    lastActive: "12 July",
                  ),
                  _buildTeamMember(
                    initials: "GA",
                    name: "Grocer Adam",
                    email: "adam@avocado.com",
                    status: "Inactive",
                    role: "Manager",
                    lastActive: "12 July",
                  ),
                  _buildTeamMember(
                    initials: "RT",
                    name: "Robin Tabelling",
                    email: "trobin@avocado.com",
                    status: "Active",
                    role: "Manager",
                    lastActive: "12 July",
                  ),
                  _buildTeamMember(
                    initials: "PL",
                    name: "Phoebe Ladi",
                    email: "phoebe@avocado.com",
                    status: "Pending",
                    role: "Member",
                    lastActive: "12 July",
                  ),
                  _buildTeamMember(
                    initials: "RI",
                    name: "Irene Ibe",
                    email: "irene.ibe@avocado.com",
                    status: "Active",
                    role: "Manager",
                    lastActive: "12 July",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildTeamMember({
    required String initials,
    required String name,
    required String email,
    required String status,
    required String role,
    required String lastActive,
  }) {
    final theme = Theme.of(context);

    return DataRow(
      cells: [
        DataCell(CircleAvatar(child: Text(initials))),
        DataCell(Text(name, style: theme.textTheme.bodyMedium)),
        DataCell(Text(email, style: theme.textTheme.bodyMedium)),
        DataCell(Text(status, style: theme.textTheme.bodyMedium)),
        DataCell(
          DropdownButton<String>(
            value: role,
            items: <String>['Manager', 'Member']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: theme.textTheme.bodyMedium),
              );
            }).toList(),
            onChanged: (String? newValue) {},
          ),
        ),
        DataCell(Text(lastActive, style: theme.textTheme.bodyMedium)),
      ],
    );
  }
}
