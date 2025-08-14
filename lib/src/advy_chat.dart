import 'package:advy_chat/src/advy_chat.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvyWidget extends StatelessWidget {
  const AdvyWidget({
    super.key,
    required this.userName,
    required this.mobileNumber,
    required this.productKey,
    this.buttonColor = Colors.blue,
    this.buttonBorderColor = Colors.black,
    this.iconColor = Colors.white,
    this.borderWidth = 1,
    this.buttonSize = 50,
    this.iconSize = 20,
    this.release = true,
    this.icon = Icons.chat,
    this.startXPosition = 20,
    this.startYPosition = 20,
  });

  final String userName;
  final String mobileNumber;
  final String productKey;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color iconColor;
  final double borderWidth;
  final double buttonSize;
  final double iconSize;
  final double startXPosition;
  final double startYPosition;
  final bool release;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final AdvyChatController controller = Get.put(AdvyChatController());
    controller.userName = userName;
    controller.mobileNumber = mobileNumber;
    controller.productKey = productKey;
    controller.release = release;
    controller.position = Offset(startXPosition, startYPosition).obs;
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
              width: buttonSize,
              height: buttonSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: buttonColor,
                border: Border.all(color: buttonBorderColor, width: borderWidth),
              ),
              child: Icon(icon, color: iconColor, size: iconSize),
            ),
          ),
        ),
      ),
    );
  }
}
