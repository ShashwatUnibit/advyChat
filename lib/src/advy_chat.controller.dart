import 'package:advy_chat/src/loading.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class AdvyChatController extends GetxController {
  String userName = "UserName";
  String mobileNumber = "MobileNumber";

  Rx<Offset> position = const Offset(100, 100).obs;

  void onButtonClick() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.white),
            child: Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("https://chat-sdk.advy.me?userName=$userName&mobile=$mobileNumber"))),
                  onWebViewCreated: (controller) {
                    LoadingPage.show();
                    InAppWebViewController inAppWebViewController;
                    LoadingPage.close();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: MediaQuery.of(context).size.width - 60),
                  child: IconButton(icon: const Icon(Icons.close, size: 30), onPressed: () => Navigator.of(context).pop()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void updatePosition(Offset delta) {
    final context = Get.context;
    if (context == null) return;

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Size of the draggable button
    const double buttonSize = 50;

    // Padding constraints
    const double horizontalPadding = 10;
    const double verticalPadding = 70;

    // New desired position
    final newX = (position.value.dx + delta.dx).clamp(horizontalPadding, screenWidth - buttonSize - horizontalPadding);

    final newY = (position.value.dy + delta.dy).clamp(verticalPadding, screenHeight - buttonSize - verticalPadding);

    position.value = Offset(newX, newY);
  }
}
