import 'package:flutter/material.dart';
import 'package:advy_chat/advy_chat.dart'; // Assuming AdvyWidget is exported from here

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: AdvyWidget(userName: 'Shashwat', mobileNumber: 'Srivastava', productKey: 'skajfd;laskjf;adlskfj;asd',),
      ),
    ),
  );
}
