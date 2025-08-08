### Advy Chat – Flutter Package for Real-Time Support
**Advy Chat** is a Flutter package that enables you to integrate a fully functional, real-time chat interface into your mobile or web applications. It connects seamlessly with the **Advy Admin Dashboard** where you can manage conversations, agents, feedback, and more.
:link: **Platform:** [chat.advy.me](https://chat.advy.me)
---
### Flutter Widget Features
- Plug-and-play integration via `AdvyWidget`
- Real-time chat with backend connectivity
- Responsive and mobile-friendly design
- Secure communication via a Product Key
- Tied to an advanced admin dashboard (hosted separately)
---
## Admin Dashboard Features (via [chat.advy.me](https://chat.advy.me))
### Live Chat Management
- View **active**, *unread*, and **closed**
- Monitor **chat activity**, response times, and operator availability
### Canned Replies
Predefined responses you can instantly send:
1. **Welcome Message**
2. **Response Time Notification**
3. **Refund Policy**
4. **Account Verification Instructions**
5. **Closing Feedback Prompt**
> These can be edited in the dashboard to match your business needs.
### Chat Analytics & Feedback
- Track user interactions and chat performance
- Visual feedback breakdown (Good / OK / Bad / No Rating)
- Operator-wise performance analysis
### Chat Settings
- **Auto Resolve Timer** – Automatically close inactive chats after a set duration
- **AI Mode** – Toggle AI assistant for automatic replies
- **Language Support** – Choose preferred chat language from 23 given Indian Languages.
- **PDF Ingestion** – Upload documents (max 25MB) for AI to response accordingly.
- **Voice Call Option** – Enable/disable in-chat internet voice calls
- **Conversation Highlights** – Use up to 5 custom highlight colors
---
## Web Integration via CDN (Optional)
If you're not using Flutter, you can also embed Advy Chat on any HTML site using the CDN method:
### Step 1: Add Script Tag

Place this in the `<head>` tag of your HTML:
```html
<script
src="https://cdn.downlink.in/advy-prod/chat/cdn.min.js?id=YOUR_PRODUCT_KEY">
</script>
```
Replace `YOUR_PRODUCT_KEY` with your actual product key from the dashboard.
### Step 2: Save & Refresh
Your live chat will now be visible on the site.
> Ensure CSP (Content Security Policy) is not blocking this domain.
---
## Getting Started with Advy
### 1. Sign Up
- Go to [chat.advy.me](https://chat.advy.me)
- Register with your email or phone
- Verify your account
### 2. Create a Product
- Login to the dashboard
- Click on **Create Organization/Product**
- Fill in app details
- Copy your **Product Key**
### 3. Use in Flutter
---
## Flutter Installation
Add to your `pubspec.yaml`:
```yaml
dependencies:
  advy_chat: ^1.1.3
```
Run:
```bash
flutter pub get
```
---
## Usage Example
```dart
import 'package:flutter/material.dart';
import 'package:advy_chat/advy_chat.dart';
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
            productKey: 'YOUR_PRODUCT_KEY_HERE',
          ),
        ),
      ),
    );
  }
}
```
---
## Testing the Widget
- Run the app on a simulator or device
- Chat widget should appear
- Send a message and verify it appears in the Advy Admin Panel
> Note: For widget tests, you may need to mock `webview_flutter`.
---
## Notes
- The Flutter package includes **only the chat widget**
- Admin dashboard & backend live at [chat.advy.me](https://chat.advy.me)
- Requires **valid Product Key** for full functionality
---
## Support & Feedback
- Read full platform docs on [chat.advy.me](https://chat.advy.me)
- [Report an issue or bug](https://pub.dev/packages/advy_chat)
- Chat with Advy support directly from your dashboard