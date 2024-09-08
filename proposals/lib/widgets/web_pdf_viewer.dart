import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WebPdfViewer extends StatefulWidget {
  final String assetPath;

  WebPdfViewer({required this.assetPath});

  @override
  _WebPdfViewerState createState() => _WebPdfViewerState();
}

class _WebPdfViewerState extends State<WebPdfViewer> {
  String? pdfDataUrl;

  @override
  void initState() {
    super.initState();
    loadPdfFromAssets();
  }

  Future<void> loadPdfFromAssets() async {
    final ByteData data = await rootBundle.load(widget.assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    setState(() {
      pdfDataUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return pdfDataUrl != null
          ? HtmlElementView(
              viewType: 'pdf-viewer',
              onPlatformViewCreated: (int viewId) {
                final html.IFrameElement element = html.IFrameElement()
                  ..src = pdfDataUrl
                  ..style.border = 'none'
                  ..style.width = '100%'
                  ..style.height = '100%';
                // ignore: undefined_prefixed_name
                ui.platformViewRegistry.registerViewFactory(
                  'pdf-viewer',
                  (int viewId) => element,
                );
              },
            )
          : Center(child: CircularProgressIndicator());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
