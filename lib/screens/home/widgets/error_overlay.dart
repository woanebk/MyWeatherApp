import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/utils/lottie_animations.dart';

class ErrorOverlay extends StatelessWidget {
  const ErrorOverlay({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(LottieAnimations.notFound, width: 300, height: 300),
            text != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      text!,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
