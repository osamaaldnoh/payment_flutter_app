import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_flutter_app/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_flutter_app/Features/checkout/data/models/init_payment_sheet_input_model.dart';

import '../../Features/checkout/data/models/payment_intent_input_model.dart';
import '../../Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'api_keys.dart';
import 'api_service.dart';

class StripeService {
  ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymantIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymantIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'osama',
      ),
    );
  }

  Future disPlayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymentIntentModel.customer);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentModel.customer,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await disPlayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      body: {
        'customer': customerId,
      },
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': '2023-10-16',
      },
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
    );

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  // Future<PaymentIntentModel> createCustomer(
  //     PaymentIntentInputModel paymentIntentInputModel) async {
  //   var response = await apiService.post(
  //     contentType: Headers.formUrlEncodedContentType,
  //     body: paymentIntentInputModel.toJson(),
  //     url: 'https://api.stripe.com/v1/payment_intents',
  //     token: ApiKeys.secretKey,
  //   );
  //
  //   var paymantIntentModel = PaymentIntentModel.fromJson(response.data);
  //
  //   return paymantIntentModel;
  // }
}
