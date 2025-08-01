import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdvyChatController extends GetxController {
  String userName = "UserName";
  String mobileNumber = "MobileNumber";

  onButtonClick() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true, // optional: allows closing by tapping outside
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Stack(
              children: [
                Center(child: WebViewWidget(controller: webViewController)),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(icon: const Icon(Icons.close, size: 30), onPressed: () => Navigator.of(context).pop()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));
}
