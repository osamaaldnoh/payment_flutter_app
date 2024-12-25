import 'package:flutter/material.dart';

class CustomDashedWidget extends StatelessWidget {
  const CustomDashedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Expanded(
            child: Container(
              color: Color(0xffB8B8B8),
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
