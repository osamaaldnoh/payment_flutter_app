import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment_flutter_app/core/utils/api_keys.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// create payment intent (amount , currncy , customerId)
//init payment sheet (PaymentIntenClientscret)
// persentPaymentSheet()
