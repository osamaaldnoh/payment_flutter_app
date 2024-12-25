import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../Manage/payment_cubit.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../thank_you_view.dart';

class CustomButtonBlockConsumer extends StatelessWidget {
  const CustomButtonBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(listener: (context, state) {
      if (state is PaymentSuccess) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) {
            return const ThankYouView();
          }),
        );
      }
      if (state is PaymentFailur) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(content: Text(state.errMessage));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //print('state.errMessage :${state.errMessage}');
      }
    }, builder: (context, state) {
      return CustomButton(
        onTap: () {
          PaymentIntentInputModel paymentIntentInputModel =
              PaymentIntentInputModel(
            amount: '100',
            currency: 'USD',
            customerId: 'cus_P06U4IIqRzonr6',
          );
          BlocProvider.of<PaymentCubit>(context)
              .makePayment(paymentIntentInputModel: paymentIntentInputModel);
        },
        isLoading: state is PaymentLoading ? true : false,
        btnText: 'Continue',
      );
    });
  }
}
