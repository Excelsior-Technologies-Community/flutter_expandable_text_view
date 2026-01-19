# 📌 Expandable Text View
A Flutter package for creating beautiful, animated expandable/collapsible text widgets with extensive customization options.

## ✨ Features

- 🎨 **Highly Customizable** - Control colors, text, icons, animations
- 🎯 **Smart Detection** - Auto-detects when text needs expansion
- 🔄 **Smooth Animations** - Built-in animated expand/collapse
- 🎮 **Programmatic Control** - Control via controller
- 📱 **Responsive** - Works on all screen sizes
- 🛠 **Extensible** - Custom button builders and widgets

---

## 🎬 Demo Preview
![Expandable Text View](https://github.com/user-attachments/assets/9c339948-812d-412c-bfcf-34e468e42fd0)



---

## 📥 Installation
### Add to your `pubspec.yaml`:
```yaml
dependencies:
  expandable_text_view:
    path: '.../flutter_expandable_text_view/expandable_text_view'
```
##

### Using GitHub (Recommended during development) :
```yaml
dependencies:
  expandable_text_view:
    git:
      url: https://github.com/<your-github>/flutter_expandable_text_view.git
```

---

## 🚀 Quick Start
```dart
import 'package:expandable_text_view/flutter_expandable_text_view.dart';

ExpandableTextView(
  text: 'Your long text here...',
  config: const ExpandableTextConfig(maxLines: 3),
)
```

---

## 🧩 Basic Usage
### 1️⃣ Simple Example
```dart
ExpandableTextView.basic(
  text: longText,
  maxLines: 2,
)
```
## 

### 2️⃣ Advanced Configuration
```dart
ExpandableTextView(
  text: longText,
  config: const ExpandableTextConfig(
    maxLines: 3,
    style: TextStyle(fontSize: 16),
    linkColor: Colors.green,
    expandText: 'Read more',
    collapseText: 'Read less',
    animationDuration: Duration(milliseconds: 500),
  ),
)
```

##

### 3️⃣ With Programmatic Control
```dart
final controller = ExpandableTextViewController();

ExpandableTextView(
  text: longText,
  controller: controller,
  config: const ExpandableTextConfig(maxLines: 2),
)

// Later...
controller.expand();
controller.collapse();
controller.toggle();
```

---

## 🏗 Project Structure
```text
expandable_text_view/
├── lib/
│   ├── src/
│   │   ├── core/
│   │   │   ├── widgets/
│   │   │   │   ├── expandable_text_view.dart
│   │   │   │   └── expandable_text_view_controller.dart
│   │   │   └── models/
│   │   │       └── expandable_text_config.dart
│   │   └── utils/
│   │       └── text_utils.dart
│   ├── expandable_text_view.dart

```

---

## ⚙️ API Reference
### ExpandableTextView
| Parameter       | Type                                   | Description                           |
|----------------|----------------------------------------|---------------------------------------|
| `text`         | `String`                               | Text to display (**required**)        |
| `config`       | `ExpandableTextConfig`                 | Configuration object                  |
| `controller`   | `ExpandableTextViewController`         | Controller for programmatic control   |
| `onExpanded`   | `VoidCallback`                         | Called when text expands              |
| `onCollapsed` | `VoidCallback`                         | Called when text collapses            |
| `buttonBuilder`| `Widget Function(bool, VoidCallback)`  | Custom button builder                 |
| `wrapInContainer` | `bool`                              | Wrap in styled container              |

##

### ExpandableTextConfig
| Property            | Type        | Default                         | Description                |
|---------------------|-------------|---------------------------------|----------------------------|
| `maxLines`          | `int`       | `3`                             | Max lines when collapsed   |
| `style`             | `TextStyle` | `TextStyle(fontSize: 14)`       | Text style                 |
| `linkColor`         | `Color`     | `Colors.blue`                   | Button color               |
| `expandText`        | `String`    | `'Show more'`                   | Expand button text         |
| `collapseText`      | `String`    | `'Show less'`                   | Collapse button text       |
| `animationDuration` | `Duration`  | `300ms`                         | Animation duration         |
| `enableAnimation`   | `bool`      | `true`                          | Enable animations          |
| `expandIcon`        | `Widget`    | `Icon(Icons.arrow_down)`        | Expand icon                |
| `collapseIcon`      | `Widget`    | `Icon(Icons.arrow_up)`          | Collapse icon              |

---

## 📜 License
```text
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```


