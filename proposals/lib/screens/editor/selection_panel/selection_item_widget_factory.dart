// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:proposals/models/routes.dart';

class SelectionItemWidgetFactory {
  final EditorRoute currentRoute;
  SelectionItemWidgetFactory(this.currentRoute);

  /**
   * 
   */
  Widget selectionItem(IconData icon, String title, BuildContext context,
      {bool isCategory = false, Widget? screen, EditorRoute? route}) {
    final isSelected = route != null && currentRoute == route;

    return GestureDetector(
      onTap: screen != null ? () => _navigateTo(context, screen) : null,
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.black),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: isCategory ? 16 : 14,
              fontWeight: isCategory ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? Colors.blue
                  : (isCategory ? Colors.black : Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
