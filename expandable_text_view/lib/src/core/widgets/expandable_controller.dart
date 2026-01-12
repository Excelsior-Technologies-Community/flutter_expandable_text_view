import 'package:flutter/material.dart';

/// Controller for ExpandableTextView with additional features
class ExpandableTextViewController {
  /// Notify listeners when text needs to be expanded/collapsed
  final ValueNotifier<bool> _expandedNotifier = ValueNotifier<bool>(false);

  /// Notify listeners when text needs to be expanded/collapsed
  ValueNotifier<bool> get expandedNotifier => _expandedNotifier;

  /// Get current expanded state
  bool get isExpanded => _expandedNotifier.value;

  /// Toggle expand/collapse
  void toggle() {
    _expandedNotifier.value = !_expandedNotifier.value;
  }

  /// Expand the text
  void expand() {
    _expandedNotifier.value = true;
  }

  /// Collapse the text
  void collapse() {
    _expandedNotifier.value = false;
  }

  /// Check if text can be expanded
  bool canExpand = false;

  /// Dispose the controller
  void dispose() {
    _expandedNotifier.dispose();
  }
}