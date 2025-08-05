import 'package:advy_chat/src/loading.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class AdvyChatController extends GetxController {
  String userName = "UserName";
  String mobileNumber = "MobileNumber";
  String productKey = "productKey";

  Rx<Offset> position = const Offset(100, 100).obs;

  void onButtonClick() {
    if (productKey == "productKey" || productKey.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text("Please provide the correct Product Key.", style: TextStyle(color: Colors.white),), backgroundColor: Color(0xFFF1616F),));
      return;
    }
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.white),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("http://192.168.1.43:5173/?productKey=$productKey&userName=$userName&mobile=$mobileNumber"))),
                    onWebViewCreated: (controller) {
                      LoadingPage.show();
                      InAppWebViewController;
                      LoadingPage.close();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 25), onPressed: () => Navigator.of(context).pop()),
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
    const double buttonSize = 50;
    const double horizontalPadding = 10;
    const double verticalPadding = 70;
    final newX = (position.value.dx + delta.dx).clamp(horizontalPadding, screenWidth - buttonSize - horizontalPadding);
    final newY = (position.value.dy + delta.dy).clamp(verticalPadding, screenHeight - buttonSize - verticalPadding);
    position.value = Offset(newX, newY);
  }
}
