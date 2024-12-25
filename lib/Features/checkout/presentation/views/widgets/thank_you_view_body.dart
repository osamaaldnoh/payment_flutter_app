import 'package:flutter/material.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/thank_you_card.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_widget.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: MediaQuery.of(context).size.height * 0.2 + 20,
            child: const CustomDashedWidget(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            right: 0,
            left: 0,
            top: -50,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
