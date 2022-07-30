import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/loading_dialog.dart';
import 'package:client/app/modules/otp/bloc/otp_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../helper/constants.dart';
import '../../../../components/default_button.dart';
import '/size_config.dart';

class OtpForm extends StatelessWidget {
  OtpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    final pinController = TextEditingController();
    final focusNode = FocusNode();

    return BlocConsumer<OtpBloc, OtpState>(listener: (context, state) {
      if (state.isLoading) {
        LoadingDialog.show(context);
      } else {
        LoadingDialog.hide(context);
      }
      if (state.isSuccess) {
        AutoRouter.of(context).replace(const HomeWrapperRoute());
      }
    }, builder: (context, state) {
      return Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) => '',
              onClipboardFound: (value) {
                debugPrint('onClipboardFound: $value');
                pinController.setText(value);
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) async {
                context.read<OtpBloc>().add(OtpEvent.verifyOTP(pin));
                debugPrint('onCompleted: ');
              },
              onChanged: (value) {
                debugPrint('onChanged: ');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      );
    });
  }
}

// import 'package:flutter/material.dart';
// import '../../../../helper/constants.dart';
// import '../../../../components/default_button.dart';
// import '/size_config.dart';

// class OtpForm extends StatefulWidget {
//   const OtpForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _OtpFormState createState() => _OtpFormState();
// }

// class _OtpFormState extends State<OtpForm> {
//   FocusNode? pin2FocusNode;
//   FocusNode? pin3FocusNode;
//   FocusNode? pin4FocusNode;

//   @override
//   void initState() {
//     super.initState();
//     pin2FocusNode = FocusNode();
//     pin3FocusNode = FocusNode();
//     pin4FocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pin2FocusNode!.dispose();
//     pin3FocusNode!.dispose();
//     pin4FocusNode!.dispose();
//   }

//   void nextField(String value, FocusNode? focusNode) {
//     if (value.length == 1) {
//       focusNode!.requestFocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           SizedBox(height: SizeConfig.screenHeight * 0.15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: getProportionateScreenWidth(60),
//                 child: TextFormField(
//                   autofocus: true,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) {
//                     nextField(value, pin2FocusNode);
//                   },
//                 ),
//               ),
//               SizedBox(
//                 width: getProportionateScreenWidth(60),
//                 child: TextFormField(
//                   focusNode: pin2FocusNode,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) => nextField(value, pin3FocusNode),
//                 ),
//               ),
//               SizedBox(
//                 width: getProportionateScreenWidth(60),
//                 child: TextFormField(
//                   focusNode: pin3FocusNode,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) => nextField(value, pin4FocusNode),
//                 ),
//               ),
//               SizedBox(
//                 width: getProportionateScreenWidth(60),
//                 child: TextFormField(
//                   focusNode: pin4FocusNode,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) {
//                     if (value.length == 1) {
//                       pin4FocusNode!.unfocus();
//                       // Then you need to check is the code is correct or not
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: SizeConfig.screenHeight * 0.15),
//           DefaultButton(
//             text: "Continue",
//             press: () {},
//           )
//         ],
//       ),
//     );
//   }
// }
