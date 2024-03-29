import 'package:bmi_calculator/widgets/calulator_button.dart';
import 'package:bmi_calculator/widgets/gender_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 160;
  double weight = 75;
  int age = 20;
  // Color genderColor = Colors.grey[400]!;
  bool isMale = true;

  void toggleGender(bool isMale) {
    setState(() {
      this.isMale = isMale;
    });
  }

  void adjustWeight(bool increase) {
    setState(() {
      increase ? weight++ : weight--;
    });
  }

  void adjustAge(bool increase) {
    setState(() {
      increase ? age++ : age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'BMI Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
           Text(
            'Gender',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => toggleGender(true),
                      child:  GenderWidget(
                        title: 'Male',
                        imagePath: 'assets/images/male.png',
                        isSelected: isMale,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => toggleGender(false),
                      child:  GenderWidget(
                        title: 'Female',
                        imagePath: 'assets/images/female.png',
                        isSelected: !isMale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD3D0D0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height (cm)',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    _buildHeightSlider(),
                    Slider(
          activeColor: const Color(0xFF2566CF),
          thumbColor: const Color(0xFF2566CF),
          value: height,
          max: 280,
          min:50,
          onChanged: (value) {
            setState(() {
              height = value;
            });
          },
        ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildInfoContainer(
                      'Weight',
                      weight.toString(),
                      () => adjustWeight(false),
                      () => adjustWeight(true),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildInfoContainer(
                      'Age',
                      age.toString(),
                      () => adjustAge(false),
                      () => adjustAge(true),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(weight: weight, height: height, isMale: isMale, age: age),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildHeightSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '${height.round()}',
          style: const TextStyle(
            fontSize: 45,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        
      ],
    );
  }

  Widget _buildInfoContainer(String title, String value, VoidCallback decrease,
      VoidCallback increase) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFD3D0D0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xFF2566CF),
                heroTag: '$title-',
                onPressed: decrease,
                child: const Icon(Icons.remove, color: Colors.white),
                mini: true,
              ),
              const SizedBox(width: 5),
              FloatingActionButton(
                backgroundColor: const Color(0xFF2566CF),
                heroTag: '$title+',
                onPressed: increase,
                child: const Icon(Icons.add, color: Colors.white),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

}