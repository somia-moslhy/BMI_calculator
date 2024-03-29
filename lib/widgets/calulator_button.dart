import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/result_page.dart';

class CalculateButton extends StatelessWidget {
  final double weight;
  final double height;
  final bool isMale;
  final int age;

  const CalculateButton({
    required this.weight,
    required this.height,
    required this.isMale,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF2566CF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: MaterialButton(
          onPressed: () {
            final result = weight / (height / 100 * height / 100);
            final gender = isMale ? 'Male' : 'Female';
            if (kDebugMode) {
              print(result.round());
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BmiResultScreen(
                  weight: weight, // Pass the weight here
                  height: height,
                  age: age,
                  gender: gender,
                ),
              ),
            );
          },
          child: const Text(
            'CALCULATE BMI',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}
