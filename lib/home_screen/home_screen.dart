import 'package:flutter/material.dart';
import 'package:flutter_expandable_text_view/src/core/models/expandable_text_config.dart';
import 'package:flutter_expandable_text_view/src/core/widgets/expandable_controller.dart';
import 'package:flutter_expandable_text_view/src/core/widgets/expandable_text_view.dart';

class ExpandableTextViewDemo extends StatefulWidget {
  const ExpandableTextViewDemo({super.key});

  @override
  State<ExpandableTextViewDemo> createState() => _ExpandableTextViewDemoState();
}

class _ExpandableTextViewDemoState extends State<ExpandableTextViewDemo> {
  final ExpandableTextViewController _controller =
      ExpandableTextViewController();

  final String longText = '''
Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. 
It allows developers to create beautiful, fast applications with a single codebase and programming language.

Key Features:
• Fast Development: Hot reload lets you see changes instantly.
• Expressive and Flexible UI: Beautiful, customizable widgets.
• Native Performance: Compiles to native ARM code for mobile.

Flutter's architecture is based on widgets, which are the building blocks of Flutter applications. 
Everything in Flutter is a widget, from structural elements like buttons and menus to stylistic elements like fonts and colors.

The framework is organized in layers, with the foundational layer being the Flutter engine, written in C++. 
Above that is the Flutter framework, written in Dart, which provides a rich set of libraries for building user interfaces.

Flutter also has excellent documentation and a vibrant community, making it easy to get started and find help when needed.
''';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Expandable TextView Library Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Basic Usage
            _buildSectionTitle('1. Basic Example'),
            ExpandableTextView.basic(text: longText, maxLines: 2),

            const SizedBox(height: 30),

            // Example 2: Advanced Configuration
            _buildSectionTitle('2. Advanced Configuration'),
            ExpandableTextView(
              text: longText,
              config: const ExpandableTextConfig(
                maxLines: 3,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.4),
                linkColor: Colors.green,
                expandText: 'Read more',
                collapseText: 'Read less',
                animationDuration: Duration(milliseconds: 500),
                enableAnimation: true,
              ),
            ),

            const SizedBox(height: 30),

            // Example 3: With Icons
            _buildSectionTitle('3. With Custom Icons'),
            ExpandableTextView(
              text: longText,
              config: ExpandableTextConfig(
                maxLines: 2,
                expandIcon: const Icon(Icons.add_circle_outline, size: 16),
                collapseIcon: const Icon(Icons.remove_circle_outline, size: 16),
                buttonStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Example 4: With Controller
            _buildSectionTitle('4. Programmatic Control'),
            ExpandableTextView(
              text: longText,
              config: const ExpandableTextConfig(maxLines: 2),
              controller: _controller,
              onExpanded: () => print('Text expanded!'),
              onCollapsed: () => print('Text collapsed!'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _controller.expand,
                  child: const Text('Expand'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _controller.collapse,
                  child: const Text('Collapse'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _controller.toggle,
                  child: const Text('Toggle'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Example 5: In Container
            _buildSectionTitle('5. Wrapped in Container'),
            ExpandableTextView(
              text: longText,
              config: const ExpandableTextConfig(
                maxLines: 2,
                padding: EdgeInsets.all(16),
                backgroundColor: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              wrapInContainer: true,
            ),

            const SizedBox(height: 30),

            // Example 6: Custom Button Builder
            _buildSectionTitle('6. Custom Button Builder'),
            ExpandableTextView(
              text: longText,
              config: const ExpandableTextConfig(maxLines: 2),
              buttonBuilder: (isExpanded, onTap) {
                return Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isExpanded ? 'Collapse' : 'Expand',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              isExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
