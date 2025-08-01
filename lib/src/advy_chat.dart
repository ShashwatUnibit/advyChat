import 'package:advy_chat/src/advy_chat.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvyWidget extends StatelessWidget {
  const AdvyWidget({super.key, required this.userName, required this.mobileNumber});

  final String userName;
  final String mobileNumber;
  final Color buttonColor = Colors.blue;
  final Color buttonBorderColor = Colors.black;
  final Color iconColor = Colors.white;
  final double borderWidth = 2;

  @override
  Widget build(BuildContext context) {
    final AdvyChatController controller = Get.put(AdvyChatController());
    controller.userName = userName;
    controller.mobileNumber = mobileNumber;

    return Obx(
      () => Padding(
        padding: EdgeInsetsGeometry.only(left: controller.position.value.dx, top: controller.position.value.dy),
        child: GestureDetector(
          onPanUpdate: (details) {
            controller.updatePosition(details.delta);
          },
          child: MaterialButton(
            onPressed: controller.onButtonClick,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            minWidth: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: buttonColor,
                border: Border.all(color: buttonBorderColor, width: borderWidth),
              ),
              child: Icon(Icons.chat, color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}
