// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import '../../../app/routes/route_path.dart';
// import '../../widgets/button.dart';
//
// class OtpAfterForgetPasswordScreen extends StatefulWidget {
//   final String email;
//
//   const OtpAfterForgetPasswordScreen({
//     super.key,
//     required this.email,
//   });
//
//   @override
//   State<OtpAfterForgetPasswordScreen> createState() => _OtpAfterForgetPasswordScreenState();
// }
//
// class _OtpAfterForgetPasswordScreenState extends State<OtpAfterForgetPasswordScreen> {
//   final TextEditingController _otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFA94442), Color(0xFF8E5BA8), Color(0xFF5B9FD8)],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               children: [
//                 SizedBox(height: 20.h),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () => context.pop(),
//                   ),
//                 ),
//                 SizedBox(height: 40.h),
//                 Text(
//                   'Forgot Password',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 60.h),
//                 Text(
//                   'We sent a reset link to\n${widget.email} enter 5 digit code\nthat mentioned in the email',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.grey.shade300,
//                     fontSize: 14.sp,
//                     height: 1.5,
//                   ),
//                 ),
//                 SizedBox(height: 60.h),
//                 PinCodeTextField(
//                   appContext: context,
//                   length: 6,
//                   controller: _otpController,
//                   keyboardType: TextInputType.number,
//                   animationType: AnimationType.fade,
//                   pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     borderRadius: BorderRadius.circular(12.r),
//                     fieldHeight: 55.h,
//                     fieldWidth: 45.w,
//                     activeColor: Colors.white,
//                     selectedColor: Colors.white,
//                     inactiveColor: Colors.white,
//                     activeFillColor: Colors.transparent,
//                     selectedFillColor: Colors.transparent,
//                     inactiveFillColor: Colors.transparent,
//                   ),
//                   enableActiveFill: true,
//                   textStyle: TextStyle(color: Colors.white, fontSize: 20.sp),
//                   onChanged: (value) {},
//                 ),
//                 SizedBox(height: 60.h),
//                 CustomButton(
//                   text: 'Verify Code',
//                   onPressed: () => context.go(RoutePath.changePassword),
//                 ),
//                 SizedBox(height: 20.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Haven\'t got the email yet? ',
//                       style: TextStyle(color: Colors.grey.shade300, fontSize: 14.sp),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Resend code',
//                         style: TextStyle(
//                           color: const Color(0xFF5BCCF6),
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../app/routes/route_path.dart';
import '../../widgets/button.dart';

class OtpAfterForgetPasswordScreen extends StatefulWidget {
  const OtpAfterForgetPasswordScreen({super.key});

  @override
  State<OtpAfterForgetPasswordScreen> createState() => _OtpAfterForgetPasswordScreenState();
}

class _OtpAfterForgetPasswordScreenState extends State<OtpAfterForgetPasswordScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Gradient Header with Back Button
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xD1AA0001), Color(0xAA005ABB)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Verify Code',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // 🔹 Instruction Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'We’ve sent a verification code to your email.\nEnter the 6-digit code below to continue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // 🔹 OTP Input Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 55,
                    fieldWidth: 45,
                    activeColor: Colors.grey.shade400,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey.shade400,
                    activeFillColor: Colors.transparent,
                    selectedFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                  ),
                  enableActiveFill: true,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {},
                  onCompleted: (value) {
                    debugPrint("Entered OTP: $value");
                  },
                ),
              ),

              const SizedBox(height: 60),

              // 🔹 Verify Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(
                  text: 'Verify Code',
                  onPressed: () {
                    context.go(RoutePath.changePassword);

                  },
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Resend Code Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Didn’t receive the code? ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Verification code resent")),
                      );
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
