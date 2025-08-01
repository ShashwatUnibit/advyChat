import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advy_chat/src/advy_chat.controller.dart';

class AdvyWidget extends StatelessWidget {
  const AdvyWidget({
    super.key,
    required this.userName,
    required this.mobileNumber,
  });

  final String userName;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    final AdvyChatController controller = Get.put(AdvyChatController());
    controller.userName = userName;
    controller.mobileNumber = mobileNumber;

    return Obx(
          () => Stack(
        children: [
          Positioned(
            left: controller.position.value.dx,
            top: controller.position.value.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                controller.updatePosition(details.delta);
              },
              child: MaterialButton(
                onPressed: controller.onButtonClick,
                color: Colors.blue,
                shape: const CircleBorder(
                  side: BorderSide(color: Colors.black),
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(Icons.chat, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
