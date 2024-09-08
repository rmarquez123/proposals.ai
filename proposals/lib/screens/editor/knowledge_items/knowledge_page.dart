// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';

class KnowledgePage extends StatelessWidget {
  
  /**
   * 
   */
  const KnowledgePage({super.key});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) { 
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUploadFilesSection(theme),
          const SizedBox(height: 24),
          _buildPastProposalsSection(theme),
          const SizedBox(height: 24),
          _buildOtherDocumentsSection(theme),
        ],
      ),
    );
  }

  Widget _buildUploadFilesSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload Files",
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            children: [
              Icon(Icons.upload_file, size: 48, color: Colors.purple),
              SizedBox(height: 8),
              Text(
                'Drag and drop files, or Browse',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Support pdf, xlsx, csv, png, jpg and docx files',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPastProposalsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Past Proposals",
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Last Modified')),
            ],
            rows: [
              _buildDataRow('Investigating the Role of Micro...', 'Dec 13, 2023'),
              _buildDataRow('Developing Innovative Solutions...', 'Dec 12, 2023'),
              _buildDataRow('Climate Change Mitigation', 'Dec 12, 2023'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOtherDocumentsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Other Documents",
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.person_add),
                  const SizedBox(width: 8),
                  Text("Select Doc from Repository", style: theme.textTheme.labelSmall),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Doc Type')),
            ],
            rows: [
              _buildDataRowWithDocType('Budget for Mid-size Projects in California', 'XLSX'),
              _buildDataRowWithDocType('Technology Architecture for the Neural Net', 'PDF'),
              _buildDataRowWithDocType('Schedule of Mid-size project from the client', 'CSV'),
            ],
          ),
        ),
      ],
    );
  }

  DataRow _buildDataRow(String name, String lastModified) {
    return DataRow(
      cells: [
        DataCell(Text(name)),
        DataCell(Text(lastModified)),
      ],
    );
  }

  DataRow _buildDataRowWithDocType(String name, String docType) {
    return DataRow(
      cells: [
        DataCell(Text(name)),
        DataCell(Text(docType)),
      ],
    );
  }
}
