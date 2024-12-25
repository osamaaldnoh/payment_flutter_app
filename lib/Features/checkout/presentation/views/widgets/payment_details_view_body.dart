import 'package:flutter/material.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/payment_methods_list_items.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../thank_you_view.dart';
import 'custome_credit_card.dart';

class PeymentDetailsViewBody extends StatefulWidget {
  PeymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PeymentDetailsViewBody> createState() => _PeymentDetailsViewBodyState();
}

class _PeymentDetailsViewBodyState extends State<PeymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PaymentMethods(),
        ),
        SliverToBoxAdapter(
          child: CustomCrditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: CustomButton(
                  btnText: 'Payment',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ThankYouView()));
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              )),
        )
      ],
    );
  }
}
