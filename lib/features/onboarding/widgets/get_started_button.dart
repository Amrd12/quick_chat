import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF002DE3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontFamily: 'mulish',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
