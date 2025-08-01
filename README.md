# 📱 Advy Chat - Flutter Package

**Advy Chat** is a Flutter package that allows developers to integrate a real-time chat widget into their applications. It is designed to enable communication between users and administrators through a dedicated backend/admin panel (not included in this package).

This package provides the frontend chat interface only. You can integrate it into any Flutter app with minimal configuration.

---

## ✨ Features

- 🧩 Easy to integrate with a single widget
- 💬 In-app real-time chat functionality
- 📱 Responsive design out of the box
- 🔒 Secure communication (requires backend setup)
- 🧑‍💻 Connects to a separate admin panel for support (not included)

---

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  advy_chat: ^1.0.1
  
```

## Then run:

## bash
flutter pub get
🛠 Usage
Import the package and use the AdvyWidget widget where you want the chat interface to appear.

```dart
import 'package:flutter/material.dart';
import 'package:advy_chat/advy_chat.dart'; // Make sure this points to the correct import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advy Chat Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Advy Chat Example')),
        body: Center(
          child: AdvyWidget(
            userName: 'John Doe',
            mobileNumber: '9876543210',
          ),
        ),
      ),
    );
  }
}
```

## 🧪 Testing
To test the package manually, simply run your app and verify the chat interface loads properly. This package is intended to be used with a working backend chat system and admin dashboard.

## If you are writing widget tests, be aware that webview_flutter may not work in widget tests without proper platform mocking.

## 📋 Note
This package does not include the admin dashboard. The dashboard for managing user conversations and sending replies is maintained separately. You need to connect this chat widget to your backend infrastructure.

## 📧 Support
For any integration issues or help with setup, feel free to open an issue or contact the package maintainer.