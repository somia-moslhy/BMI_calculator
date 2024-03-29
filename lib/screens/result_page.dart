import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/retry_button.dart';

class BmiResultScreen extends StatefulWidget {
  final double weight;
  final double height;
  final int age;
  final String gender;

  const BmiResultScreen(  {super.key,
      required this.weight,
      required this.height,
      required this.age,
      required this.gender});

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  double bmi = 0;
  String bmiText = 'Normal';
  String underWeight =   
       '  A BMI of less than 18.5 indicates that your\n'
       '  weight is in the normalWeight category for a\n'
       '         person of your height\n\n'
       ' Maintaining a healthy weight reduce the\n'
       '  risk of diseases associated with\n'
       '        overweight and obesity';
  String normalWeight =
       '  A BMI of 18.5 - 24.99 indicates that your\n'
       ' weight is in the normalWeight category for a\n'
       '         person of your height\n\n'
       ' Maintaining a healthy weight reduce the\n'
       '  risk of diseases associated with\n'
       '        overweight and obesity';
  String overWeight =
       '  A BMI of 25 - 29.99  indicates that your\n'
       ' weight is in the overweight category for a\n'
       '         person of your height\n\n'
       ' Maintaining a healthy weight reduce the\n'
       '  risk of diseases associated with\n'
       '        overweight and obesity';
  String obese =
       ' A BMI of 30 - 34.99 indicates that your\n'
       '   weight is in the obese category for a\n'
       '         person of your height\n\n'
       ' Maintaining a healthy weight reduce the\n'
       '  risk of diseases associated with\n'
       '        overweight and obesity';
  String extremelyObese =
       ' A BMI of 35 and more indicates that your\n'
       '    weight is in the () category for a\n'
       '         person of your height\n\n'
       ' Maintaining a healthy weight reduce the\n'
       '  risk of diseases associated with\n'
       '        overweight and obesity';

  @override
  void initState() {
    super.initState();
    calculateBMI();
  }

  void calculateBMI() {
    setState(() {
      bmi = widget.weight / (widget.height * widget.height / 10000);
      if (bmi < 18.5) {
        bmiText = 'Underweight';
      } else if (bmi < 25) {
        bmiText = 'Normal weight';
      } else if (bmi < 30) {
        bmiText = 'Overweight';
      } else if (bmi < 35) {
        bmiText = 'Obese';
      } else {
        bmiText = 'Extremely Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Back',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              const Text(
                'Your BMI is',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    color: Color(0xff2566CF),
    borderRadius: BorderRadius.circular(20.0),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Align children in the center
    children: [
      Text(
         bmi.toStringAsFixed(2),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        
        ),
      ),
      Text(
        'Kg/m2',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xffA6B7D5),
          fontSize: 20,
        ),
      ),
    ],
  ),
),
              const SizedBox(height: 30),
              Text(
                '($bmiText)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            widget.gender == 'Male'
                                ? 'assets/images/man.png'
                                : 'assets/images/woman.png',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.gender,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.age.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.height.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Height',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                             widget.weight.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      bmi < 18.5
                          ? underWeight
                          : bmi < 25
                              ? normalWeight
                              : bmi < 30
                                  ? overWeight
                                  : bmi < 35
                                      ? obese
                                      : extremelyObese,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const CustomRestartButton(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
