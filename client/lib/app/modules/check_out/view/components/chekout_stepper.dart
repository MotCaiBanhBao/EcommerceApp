import 'package:client/app/modules/check_out/view/components/address_page.dart';
import 'package:client/app/modules/check_out/view/components/order_page.dart';
import 'package:client/app/modules/check_out/view/components/payment_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../cubit/checkout_cubit.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Stepper(
          type: StepperType.horizontal,
          currentStep: state.activeStepperIndex,
          onStepTapped: context.read<CheckoutCubit>().stepTapped,
          controlsBuilder: (context, controlDetails) {
            return const SizedBox.shrink();
          },
          steps: [
            Step(
              title: const Text('Order'),
              content: const OrderPage(),
              isActive: state.activeStepperIndex >= 0,
              state: state.activeStepperIndex >= 0
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(LocaleKeys.address_to_take_txt.tr()),
              content: const AddressPage(),
              isActive: state.activeStepperIndex >= 1,
              state: state.activeStepperIndex >= 1
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: const Text('Payment'),
              content: PaymentPage(),
              isActive: state.activeStepperIndex >= 2,
              state: state.activeStepperIndex >= 2
                  ? StepState.complete
                  : StepState.disabled,
            ),
          ],
        );
      },
    );
  }
}
