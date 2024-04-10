import 'dart:async';

import 'package:devy_boiler_plate/dev/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerPage extends StatefulWidget {
  final String path;
  final String title;
  const PDFViewerPage({super.key, required this.path, required this.title});

  static const routeName = '/pdf-viewer.dart';

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            PDF(
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: true,
              pageSnap: true,
              defaultPage: currentPage!,
              fitPolicy: FitPolicy.BOTH,
              preventLinkNavigation: false,
              onRender: (pages) {
                setState(() {
                  pages = pages;
                  isReady = true;
                });
              },
              onError: (error) {
                errorMessage = error.toString();
                DevLogger().logStackError(error.toString());
              },
              onPageError: (page, error) {
                errorMessage = error.toString();
                DevLogger().logStackError(error.toString());
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onPageChanged: (int? page, int? total) {
                setState(() {
                  currentPage = page;
                });
              },
            ).cachedFromUrl(widget.path),
          ],
        ));
  }
}
