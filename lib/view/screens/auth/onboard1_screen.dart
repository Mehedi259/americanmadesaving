import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes/route_path.dart';
import '../../widgets/button.dart';

class Onboard1Screen extends StatelessWidget {
  const Onboard1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0xFFF3F4F6), Color(0xFF396AA3)],
          ),
          shape: RoundedRectangleBorder(), // Required with ShapeDecoration
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/capitol.png',
                width: double.infinity,
              ),
              SizedBox(height: 40),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () => context.go(RoutePath.onboard2),
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
