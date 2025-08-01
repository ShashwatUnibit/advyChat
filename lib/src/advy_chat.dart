import 'package:flutter/material.dart';
import 'package:advy_chat/src/advy_chat.controller.dart';

class AdvyWidget extends StatefulWidget {
  const AdvyWidget({super.key, required this.userName, required this.mobileNumber});

  final String userName;
  final String mobileNumber;

  @override
  State<AdvyWidget> createState() => _AdvyWidgetState();
}

class _AdvyWidgetState extends State<AdvyWidget> {
  final AdvyChatController controller = AdvyChatController();

  // Starting position of the button
  Offset position = const Offset(100, 100);

  @override
  void initState() {
    super.initState();
    controller.userName = widget.userName;
    controller.mobileNumber = widget.mobileNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position += details.delta;
              });
            },
            child: MaterialButton(
              onPressed: controller.onButtonClick,
              color: Colors.blue,
              shape: const CircleBorder(side: BorderSide(color: Colors.black)),
              padding: const EdgeInsets.all(20),
              child: const Icon(Icons.chat, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
