// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/**
 * 
 */
class RfpSummaryMainContent extends StatelessWidget {
  
  const RfpSummaryMainContent({super.key});

  /**
   * 
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RFP Summary"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SfPdfViewer.asset(
          'sample.pdf',
        ),
      ),
    );
  }
}
