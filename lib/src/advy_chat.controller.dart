import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class AdvyChatController extends GetxController {
  String userName = "UserName";
  String mobileNumber = "MobileNumber";
  String productKey = "productKey";
  late bool release;

  Rx<Offset> position = Offset(Get.width - 65, Get.height - 180).obs;

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
                    initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse("${release ? "https://chat-sdk.advy.me" : "http://192.168.1.43:5173"}/?productKey=$productKey&userName=$userName&mobile=$mobileNumber")),
                    ),
                    onPermissionRequest: (controller, request) async {
                      return PermissionResponse(resources: request.resources, action: PermissionResponseAction.GRANT);
                    },
                    initialSettings: InAppWebViewSettings(javaScriptEnabled: true, mediaPlaybackRequiresUserGesture: false, allowsInlineMediaPlayback: true, useShouldOverrideUrlLoading: true),
                    onLoadStart: (controller, url) {
                      print("Page started loading: $url");
                    },
                    onLoadStop: (controller, url) {
                      print("Page finished loading: $url");
                    },
                    onProgressChanged: (controller, progress) {
                      print("Loading progress: $progress%");
                    },
                    onWebViewCreated: (controller) {
                      InAppWebViewController;
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    minWidth: 0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "Close",
                      style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
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
