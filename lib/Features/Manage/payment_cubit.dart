import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../checkout/data/models/payment_intent_input_model.dart';
import '../checkout/data/repo/checkout_repo.dart';
import 'package:meta/meta.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((l) => emit(PaymentFailur(l.errMessage)),
        (r) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
