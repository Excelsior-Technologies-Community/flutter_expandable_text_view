import 'package:flutter/material.dart';

/// Configuration class for ExpandableTextView
class ExpandableTextConfig {
  /// Maximum lines when text is collapsed
  final int maxLines;

  /// Text style
  final TextStyle style;

  /// Color for expand/collapse button
  final Color linkColor;

  /// Text for expand button
  final String expandText;

  /// Text for collapse button
  final String collapseText;

  /// Whether to show expand button when text doesn't exceed maxLines
  final bool alwaysShowButton;

  /// Text alignment
  final TextAlign textAlign;

  /// Text overflow style when collapsed
  final TextOverflow overflow;

  /// Animation duration for expand/collapse
  final Duration animationDuration;

  /// Animation curve for expand/collapse
  final Curve animationCurve;

  /// Whether to enable animation
  final bool enableAnimation;

  /// Custom icon for expand button
  final Widget? expandIcon;

  /// Custom icon for collapse button
  final Widget? collapseIcon;

  /// Button text style
  final TextStyle? buttonStyle;

  /// Padding around the button
  final EdgeInsets buttonPadding;

  /// Background color for the widget
  final Color? backgroundColor;

  /// Border radius for background
  final BorderRadius? borderRadius;

  /// Padding for the entire widget
  final EdgeInsets padding;

  const ExpandableTextConfig({
    this.maxLines = 3,
    this.style = const TextStyle(fontSize: 14, height: 1.5),
    this.linkColor = Colors.blue,
    this.expandText = 'Show more',
    this.collapseText = 'Show less',
    this.alwaysShowButton = false,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.enableAnimation = true,
    this.expandIcon,
    this.collapseIcon,
    this.buttonStyle,
    this.buttonPadding = const EdgeInsets.only(top: 8.0),
    this.backgroundColor,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
  });

  /// Create a copy of the configuration with overrides
  ExpandableTextConfig copyWith({
    int? maxLines,
    TextStyle? style,
    Color? linkColor,
    String? expandText,
    String? collapseText,
    bool? alwaysShowButton,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableAnimation,
    Widget? expandIcon,
    Widget? collapseIcon,
    TextStyle? buttonStyle,
    EdgeInsets? buttonPadding,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
  }) {
    return ExpandableTextConfig(
      maxLines: maxLines ?? this.maxLines,
      style: style ?? this.style,
      linkColor: linkColor ?? this.linkColor,
      expandText: expandText ?? this.expandText,
      collapseText: collapseText ?? this.collapseText,
      alwaysShowButton: alwaysShowButton ?? this.alwaysShowButton,
      textAlign: textAlign ?? this.textAlign,
      overflow: overflow ?? this.overflow,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      expandIcon: expandIcon ?? this.expandIcon,
      collapseIcon: collapseIcon ?? this.collapseIcon,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }
}