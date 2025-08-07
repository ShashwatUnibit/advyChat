import 'package:advy_chat/src/loading.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class AdvyChatController extends GetxController {
  String userName = "UserName";
  String mobileNumber = "MobileNumber";
  String productKey = "productKey";

  Rx<Offset> position = Offset(Get.width - 65, Get.height - 130).obs;

  void onButtonClick() {
    if (productKey == "productKey" || productKey.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("Please provide the correct Product Key.", style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFF1616F),
        ),
      );
      return;
    }
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.white),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(15)),
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("http://192.168.1.43:5173/?productKey=$productKey&userName=$userName&mobile=$mobileNumber"))),
                    onLoadStart: (controller, url) {
                      LoadingPage.show();
                    },
                    onLoadStop: (controller, url) async {
                      final html = await controller.evaluateJavascript(source: "document.body.innerText");
                      if (html.contains("Your chat has ended")) {
                        Navigator.of(Get.context!).pop(); // or other Flutter action
                      }
                    },
                    onWebViewCreated: (controller) {
                      InAppWebViewController;
                    },
                    shouldOverrideUrlLoading: (controller, navAction) async {
                      final uri = navAction.request.url;
                      final url = uri.toString();

                      if (url.contains("chat-ended") || url.contains("https://chat-sdk.advy.me/")) {
                        Navigator.of(Get.context!).pop();
                        return NavigationActionPolicy.CANCEL;
                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width - 65, top: Get.height - 130),
                  child: IconButton(padding: EdgeInsets.zero, icon: const Icon(Icons.close, size: 20), onPressed: () => Navigator.of(context).pop()),
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
