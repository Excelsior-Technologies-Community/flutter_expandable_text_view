import 'package:flutter/material.dart';
import 'package:flutter_expandable_text_view/expandable_text_view.dart';

/// An advanced expandable text view widget with animations and customization
class ExpandableTextView extends StatefulWidget {
  /// The text to display
  final String text;

  /// Configuration for the widget
  final ExpandableTextConfig config;

  /// Custom controller for programmatic control
  final ExpandableTextViewController? controller;

  /// Callback when text is expanded
  final VoidCallback? onExpanded;

  /// Callback when text is collapsed
  final VoidCallback? onCollapsed;

  /// Callback when widget is tapped (if button is not shown)
  final VoidCallback? onTap;

  /// Custom widget builder for the expand/collapse button
  final Widget Function(bool isExpanded, VoidCallback onTap)? buttonBuilder;

  /// Whether to wrap text in a container with background
  final bool wrapInContainer;

  /// Maximum width for the text
  final double? maxWidth;

  ExpandableTextView({
    super.key,
    required this.text,
    this.config = const ExpandableTextConfig(),
    this.controller,
    this.onExpanded,
    this.onCollapsed,
    this.onTap,
    this.buttonBuilder,
    this.wrapInContainer = false,
    this.maxWidth,
  }) : assert(config.maxLines > 0, 'maxLines must be greater than 0');

  /// Convenience constructor with minimal parameters
  ExpandableTextView.basic({
    super.key,
    required this.text,
    int maxLines = 3,
    TextStyle? style,
    this.controller,
    this.maxWidth,
  }) : config = ExpandableTextConfig(
         maxLines: maxLines,
         style: style ?? const TextStyle(fontSize: 14, height: 1.5),
       ),
       onExpanded = null,
       onCollapsed = null,
       onTap = null,
       buttonBuilder = null,
       wrapInContainer = false;

  @override
  State<ExpandableTextView> createState() => _ExpandableTextViewState();
}

class _ExpandableTextViewState extends State<ExpandableTextView>
    with SingleTickerProviderStateMixin {
  late ExpandableTextViewController _controller;
  bool _isExpanded = false;
  bool _needsExpansion = false;
  GlobalKey textKey = GlobalKey();
  late AnimationController _animationController;
  late Animation<double> heightAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    );

    heightAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.config.animationCurve,
    );

    // Initialize controller
    _controller = widget.controller ?? ExpandableTextViewController();
    _isExpanded = _controller.isExpanded;

    // Listen to controller changes
    _controller.expandedNotifier.addListener(_onControllerChanged);

    // Post-frame callback to check if expansion is needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfNeedsExpansion();
    });
  }

  void _onControllerChanged() {
    if (_controller.isExpanded != _isExpanded) {
      if (widget.config.enableAnimation) {
        _isExpanded
            ? _animationController.reverse()
            : _animationController.forward();
      }

      setState(() {
        _isExpanded = _controller.isExpanded;
        if (_isExpanded) {
          widget.onExpanded?.call();
        } else {
          widget.onCollapsed?.call();
        }
      });
    }
  }

  void _checkIfNeedsExpansion() {
    final renderBox = textKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final lineCount = TextUtils.calculateLineCount(
        text: widget.text,
        maxWidth: renderBox.size.width,
        style: widget.config.style,
        maxLines: widget.config.maxLines + 1,
      );

      setState(() {
        _needsExpansion = lineCount > widget.config.maxLines;
        _controller.canExpand = _needsExpansion;
      });
    }
  }

  void _toggleExpansion() {
    _controller.toggle();
  }

  @override
  void didUpdateWidget(covariant ExpandableTextView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text ||
        widget.config.maxLines != oldWidget.config.maxLines ||
        widget.config.style != oldWidget.config.style) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkIfNeedsExpansion();
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    _controller.expandedNotifier.removeListener(_onControllerChanged);
    super.dispose();
  }

  Widget _buildButton(bool isExpanded) {
    if (widget.buttonBuilder != null) {
      return widget.buttonBuilder!(isExpanded, _toggleExpansion);
    }

    return Padding(
      padding: widget.config.buttonPadding,
      child: GestureDetector(
        onTap: _toggleExpansion,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isExpanded
                  ? widget.config.collapseText
                  : widget.config.expandText,
              style:
                  widget.config.buttonStyle ??
                  widget.config.style.copyWith(
                    color: widget.config.linkColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 4),
            if (isExpanded)
              widget.config.collapseIcon ??
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: widget.config.linkColor,
                    size: 16,
                  )
            else
              widget.config.expandIcon ??
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: widget.config.linkColor,
                    size: 16,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    final shouldShowButton = _needsExpansion || widget.config.alwaysShowButton;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text with animation
        GestureDetector(
          onTap: shouldShowButton ? _toggleExpansion : widget.onTap,
          child: AnimatedSize(
            duration: widget.config.enableAnimation
                ? widget.config.animationDuration
                : Duration.zero,
            curve: widget.config.animationCurve,
            alignment: Alignment.topLeft,
            child: Container(
              key: textKey,
              constraints: widget.maxWidth != null
                  ? BoxConstraints(maxWidth: widget.maxWidth!)
                  : null,
              child: Text(
                widget.text,
                style: widget.config.style,
                maxLines: _isExpanded ? null : widget.config.maxLines,
                overflow: _isExpanded ? null : widget.config.overflow,
                textAlign: widget.config.textAlign,
              ),
            ),
          ),
        ),

        // Expand/Collapse button
        if (shouldShowButton) _buildButton(_isExpanded),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _buildText();

    // Wrap in container if requested
    if (widget.wrapInContainer) {
      content = Container(
        padding: widget.config.padding,
        decoration: BoxDecoration(
          color: widget.config.backgroundColor,
          borderRadius: widget.config.borderRadius,
        ),
        child: content,
      );
    }

    return content;
  }
}
