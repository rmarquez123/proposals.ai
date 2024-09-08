// ignore_for_file: slash_for_doc_comments

class TextContent {
  final List<Insert> inserts;

  /**
   * 
   */
  TextContent(this.inserts);

  /**
   * 
   */
  List<Map<String, dynamic>> toJson() {
    final List<Map<String, dynamic>> jsonOutput =
        inserts.map((insert) => insert.toJson()).toList();
    return jsonOutput;
  }

  /**
   * Generate an outline of the document based on heading attributes.
   */
  List<OutlineNode> getOutline() {
    final List<OutlineNode> outline = [];
    OutlineNode? currentNode;
    for (var insert in inserts) {
      if (insert.insert.trim().isEmpty) {
        continue;
      }
      if (insert.attributes?.heading != null) {
        final newNode = OutlineNode(
          insert.insert.trim(),
          insert.attributes!.heading!,
          [],
        );

        if (currentNode == null) {
          outline.add(newNode);
          currentNode = newNode;
        } else {
          while (currentNode != null && currentNode.level >= newNode.level) {
            currentNode = currentNode.parent;
          }
          if (currentNode == null) {
            outline.add(newNode);
            currentNode = newNode;
          } else {
            currentNode.children.add(newNode);
            newNode.parent = currentNode;
            currentNode = newNode;
          }
        }
      }
    }
    return outline;
  }
}

/**
 * 
 */
class Insert {
  final String insert;
  final Attribute? attributes;

  Insert({required this.insert, this.attributes});

  factory Insert.fromJson(Map<String, dynamic> json) {
    return Insert(
      insert: json['insert'],
      attributes: json['attributes'] != null
          ? Attribute.fromJson(json['attributes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'insert': insert,
      'attributes': attributes?.toJson(),
    };
  }
}

class Attribute {
  final bool? bold;
  final int? heading;

  Attribute({required this.bold, required this.heading});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      bold: json['b'] ?? false,
      heading: json['heading'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {
      'bold': bold,
    };
    if (heading != 0) {
      result["heading"] = heading; 
    }
    return result; 
  }

}


class OutlineNode {
  final String text;
  final int level;
  final List<OutlineNode> children;
  OutlineNode? parent;

  OutlineNode(this.text, this.level, this.children);
}
