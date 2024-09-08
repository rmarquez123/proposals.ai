// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';

class CorporateDetailsPage extends StatelessWidget {
  const CorporateDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Corporate Details",
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildCompanyInfo(theme),
          const SizedBox(height: 24),
          _buildBrandingTemplates(theme),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo(ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Company Info",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Company Name: Swift Utilities Construction Ltd."),
            Text("Email Address: info@swiftutilities.com"),
            const SizedBox(height: 8),
            Text(
              "Company Executive Summary",
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "Swift Utilities Construction Ltd. is a leading provider of utility infrastructure services, specializing in the construction and maintenance of water, gas, electricity, and telecommunications systems. Established in 2005, our company has built a reputation for delivering high-quality projects on time and within budget. With a team of experienced engineers, project managers, and skilled laborers, we offer a comprehensive range of services including pipeline installation, electrical grid expansion, fiber optic network deployment, and emergency repair services. Our commitment to safety, innovation, and sustainability drives us to adopt the latest technologies and best practices in the industry. We prioritize environmental stewardship and community engagement in all our projects, ensuring minimal disruption and maximum benefit to the communities we serve.",
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandingTemplates(ThemeData theme) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Company Branding Templates",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTemplateItem("Proposal Template", "XLSX", theme),
            _buildTemplateItem("Budgeting Template", "PDF", theme),
            _buildTemplateItem("Schedule Template", "CSV", theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateItem(String templateName, String templateType, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(templateName, style: theme.textTheme.bodyMedium),
        trailing: Text(templateType, style: theme.textTheme.bodySmall),
      ),
    );
  }
}
