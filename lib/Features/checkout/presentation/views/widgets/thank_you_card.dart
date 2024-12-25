import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/total_price_widget.dart';

import '../../../../../core/utils/styles.dart';
import 'card_info_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:45 PM',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Divider(
              thickness: 2,
              height: 60,
            ),
            const TotalPrice(
              title: 'Total',
              value: r'$50.47',
            ),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'PAID',
                    textAlign: TextAlign.center,
                    style: Styles.style24.copyWith(
                      color: Color(0xFF34A853),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.of(context).size.height * .2 + 20) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
