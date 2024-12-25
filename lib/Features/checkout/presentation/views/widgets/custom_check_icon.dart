import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.green,
        child: Center(
            child: Icon(
          Icons.check,
          size: 50,
        )),
      ),
    );
  }
}
