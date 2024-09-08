// ignore_for_file: slash_for_doc_comments

import 'package:proposals/models/item_bloc/items_repository.dart';
import 'package:proposals/screens/editor/proposal_editor/text_content/text_content.dart';

class TextContentRepository implements ItemRepository<TextContent, dynamic> {
  /**
   * 
   */
  @override
  Future<TextContent> fetchItem(parameters) async {
    await Future.delayed(const Duration(seconds: 1));
    final json = [
      {"insert": "Utilities Installation Proposal"},
      {
        "insert": "\n",
        "attributes": {"heading": 1}
      },
      {
        "insert": "Introduction Letter",
        "attributes": {"b": true}
      },
      {"insert": "\nDear Haro Real Corps,\n\n"},
      {
        "insert":
            "We are pleased to present our proposal for the Utilities Installation project for your Greenfield Residential Development. At [Your Company Name], we are committed to delivering top-quality infrastructure solutions that meet your specific needs. Our experienced team is prepared to ensure the seamless installation of all necessary utilities, facilitating the successful development of your residential project.\n\nWe look forward to the opportunity to collaborate with you on this project.\nSincerely,\nClifford A.\n"
      },
      {
        "insert": "Project Description & Purpose",
        "attributes": {"b": true}
      },
      {
        "insert":
            "\nThe Utilities Installation project involves the comprehensive planning, design, and installation of essential utilities for a new residential development. This includes water supply, sewage systems, electrical power, natural gas, and telecommunications infrastructure. The purpose of this project is to provide reliable and efficient utility services to the future residents of the development, ensuring a high quality of life and adherence to modern living standards.\n\n"
      },
      {
        "insert": "Background",
        "attributes": {"b": true}
      },
      {
        "insert": "\nContext and Importance of the Project",
        "attributes": {"b": true}
      },
      {
        "insert": 
            "\nThe Greenfield Residential Development is a significant project aimed at addressing the growing demand for housing in the area. The installation of utilities is a critical component, as it forms the backbone of any residential area, supporting daily activities and contributing to the overall functionality and livability of the community. Properly installed utilities will not only ensure the comfort and safety of residents but also enhance the property’s value and attractiveness to potential buyers.\n"
      },
      {
        "insert": "Client’s Role & Responsibilities",
        "attributes": {"b": true}
      },
      {
        "insert":
            "\n- Project Oversight: Providing overall guidance and decision-making for the project.\n- Approval of Plans: Reviewing and approving design and engineering plans.\n- Timely Payments: Ensuring payments are made according to the agreed schedule.\n- Access Facilitation: Granting necessary site access for survey, design, and construction activities.\n- Communication: Maintaining open lines of communication with the project team to address any issues promptly.\n\n"
      },
      {
        "insert": "Project Objectives and Goals",
        "attributes": {"b": true}
      },
      {
        "insert":
            "\n- Timely Completion: Complete the utilities installation within the agreed timeframe.\n- Quality Standards: Adhere to industry standards and regulations to ensure high-quality installations.\n- Cost Efficiency: Optimize resource use to stay within budget while maintaining quality.\n- Sustainability: Implement eco-friendly practices and materials where possible to minimize environmental impact.\n- Client Satisfaction: Ensure the client’s expectations and requirements are met or exceeded.\n"
      }
    ];

    try {
      final List<Insert> inserts =
          json.map((data) => Insert.fromJson(data)).toList();
      return TextContent(inserts);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /**
   * 
   */
  @override
  Future<void> updateItem(TextContent item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
