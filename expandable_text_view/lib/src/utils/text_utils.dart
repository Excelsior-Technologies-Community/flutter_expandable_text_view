import 'package:flutter/material.dart';

/// Text utility functions for the ExpandableTextView package
class TextUtils {
  /// Calculate number of lines text will occupy
  static int calculateLineCount({
    required String text,
    required double maxWidth,
    required TextStyle style,
    int? maxLines,
  }) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );
    textPainter.layout(maxWidth: maxWidth);
    return textPainter.computeLineMetrics().length;
  }

  /// Get collapsed text with ellipsis
  static String getCollapsedText({
    required String text,
    required int maxLines,
    required TextStyle style,
    required double maxWidth,
  }) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );
    textPainter.layout(maxWidth: maxWidth);

    final position = textPainter.getPositionForOffset(
      Offset(maxWidth, textPainter.size.height),
    );
    final endIndex = position.offset;

    if (endIndex < text.length - 3) {
      return '${text.substring(0, endIndex)}...';
    }
    return text;
  }

  /// Calculate text height
  static double calculateTextHeight({
    required String text,
    required double maxWidth,
    required TextStyle style,
    int? maxLines,
  }) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );
    textPainter.layout(maxWidth: maxWidth);
    return textPainter.size.height;
  }
}