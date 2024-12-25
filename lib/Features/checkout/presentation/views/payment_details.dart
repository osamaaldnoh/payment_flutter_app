
import 'package:flutter/material.dart';
import 'package:payment_flutter_app/Features/checkout/presentation/views/widgets/payment_details_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class PeymentDetailsView extends StatelessWidget {
  const PeymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Peyment Details'),
      body: PeymentDetailsViewBody(),
    );
  }
}
