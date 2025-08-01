import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage {
  static bool isLoading = false;
  static Future<dynamic> show() {
    if (isLoading) {
      return Future.value();
    }
    isLoading = true;
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: Center(
              heightFactor: 1,
              widthFactor: 1,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Get.context!.theme.colorScheme.onPrimary),
                height: 100,
                width: 100,
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: FittedBox(child: CupertinoActivityIndicator(color: Get.context!.theme.colorScheme.primary)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static close() {
    if (isLoading) {
      Get.back();
      isLoading = false;
    }
  }

  static Widget listLoading() {
    return Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: FittedBox(child: CupertinoActivityIndicator(color: Get.context!.theme.colorScheme.primary)),
      ),
    );
  }
}
