import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/payment_methods_button_sheet.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/total_price_widget.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../Manage/payment_cubit.dart';
import '../../../data/repo/checkout_repo_impl.dart';
import 'cart_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset('images/basket_image.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            color: Color(0xffC7C7C7),
            thickness: 2,
            height: 34,
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            btnText: 'Complete Payment',
            onTap: () {
              showBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (ctx) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: PaymentMethodsButtonSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
