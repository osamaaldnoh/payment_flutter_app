import 'package:flutter/cupertino.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethods extends StatefulWidget {
  PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<String> paymentMethodsItems = [
    'images/card.svg',
    'images/paypal.svg',
    'images/card.svg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: ListView.builder(
          itemCount: paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  activeIndex = index;
                  setState(() {});
                },
                child: PaymentMethodItem(
                  isActive: activeIndex == index,
                  image: paymentMethodsItems[index],
                ),
              ),
            );
          }),
    );
  }
}
