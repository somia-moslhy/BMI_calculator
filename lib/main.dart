import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMI_calculator());
}

class BMI_calculator extends StatelessWidget {
  const BMI_calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
