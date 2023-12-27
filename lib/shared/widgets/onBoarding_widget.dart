import 'package:flutter/material.dart';
import 'package:shop_app/views/onBoarding/onBoarding_view.dart';

Widget onBoardingItem(OnBoarding model) {
  return Column(
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
          fit: BoxFit.fitWidth,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        model.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Baloo2',
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}
