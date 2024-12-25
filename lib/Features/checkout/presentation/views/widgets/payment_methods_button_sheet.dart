import 'package:flutter/cupertino.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/custom_botton_block_consumer.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/payment_methods_list_items.dart';
import 'package:payment_flutter_app/core/widgets/custom_button.dart';

class PaymentMethodsButtonSheet extends StatelessWidget {
  const PaymentMethodsButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethods(),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBlockConsumer(),
        ],
      ),
    );
  }
}
