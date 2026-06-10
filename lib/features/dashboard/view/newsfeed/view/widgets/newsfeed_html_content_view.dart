import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsfeedHtmlHelper {
  static String buildHtmlDocument(String? rawHtml) {
    final content = rawHtml?.trim() ?? '';
    if (content.isEmpty) {
      return _wrapBody('<p class="empty-state">Không có nội dung</p>');
    }

    final normalized = _normalizeHtml(content);
    final hasHtmlTag = RegExp(r'<\s*html[\s>]', caseSensitive: false).hasMatch(normalized);
    if (hasHtmlTag) {
      return normalized;
    }

    final hasBodyLikeTag = RegExp(
      r'<\s*(div|section|article|main|table|p|span|h1|h2|h3|h4|h5|h6|ul|ol|img|style)[\s>]',
      caseSensitive: false,
    ).hasMatch(normalized);

    return _wrapBody(hasBodyLikeTag ? normalized : '<p>$normalized</p>');
  }

  static String _normalizeHtml(String value) {
    return value
        .replaceAll('&nbsp;', ' ')
        .replaceAll(RegExp(r'\r\n?'), '\n')
        .trim();
  }

  static String _wrapBody(String body) {
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  <style>
    :root {
      color-scheme: light;
    }
    * {
      box-sizing: border-box;
      max-width: 100%;
      word-break: break-word;
    }
    html, body {
      margin: 0;
      padding: 0;
      background: transparent;
      color: #1F2937;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      font-size: 15px;
      line-height: 1.65;
      overflow-x: hidden;
    }
    body {
      padding: 0;
    }
    img, video, iframe, table {
      max-width: 100% !important;
    }
    table {
      width: 100% !important;
      border-collapse: collapse;
      display: block;
      overflow-x: auto;
      white-space: normal;
    }
    p {
      margin: 0 0 12px;
    }
    .empty-state {
      color: #6B7280;
      font-style: italic;
    }
  </style>
</head>
<body>
$body
</body>
</html>
''';
  }
}

class NewsfeedHtmlContentView extends StatefulWidget {
  const NewsfeedHtmlContentView({
    super.key,
    required this.html,
    this.backgroundColor = Colors.transparent,
  });

  final String html;
  final Color backgroundColor;

  @override
  State<NewsfeedHtmlContentView> createState() => _NewsfeedHtmlContentViewState();
}

class _NewsfeedHtmlContentViewState extends State<NewsfeedHtmlContentView> {
  late final WebViewController _controller;
  double _contentHeight = 1;
  bool _isLoading = true;
  Timer? _heightDebounce;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(widget.backgroundColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            _scheduleHeightSync();
          },
        ),
      )
      ..loadHtmlString(NewsfeedHtmlHelper.buildHtmlDocument(widget.html));
  }

  @override
  void didUpdateWidget(covariant NewsfeedHtmlContentView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.html != widget.html) {
      setState(() {
        _isLoading = true;
        _contentHeight = 1;
      });
      _controller.loadHtmlString(NewsfeedHtmlHelper.buildHtmlDocument(widget.html));
    }
  }

  @override
  void dispose() {
    _heightDebounce?.cancel();
    super.dispose();
  }

  void _scheduleHeightSync() {
    _heightDebounce?.cancel();
    _heightDebounce = Timer(const Duration(milliseconds: 120), _syncHeight);
  }

  Future<void> _syncHeight() async {
    if (!mounted) return;
    try {
      final result = await _controller.runJavaScriptReturningResult(
        'Math.max(document.body.scrollHeight, document.documentElement.scrollHeight).toString();',
      );
      final height = double.tryParse(result.toString().replaceAll('"', ''));
      if (!mounted) return;
      setState(() {
        _contentHeight = height != null && height > 1 ? height : 1;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      child: Stack(
        children: [
          SizedBox(
            height: _contentHeight,
            child: WebViewWidget(controller: _controller),
          ),
          if (_isLoading)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
