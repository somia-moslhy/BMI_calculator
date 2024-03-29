import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;

  const GenderWidget({
    required this.title,
    required this.imagePath,
    this.isSelected = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
            height: 90,
            width: 90,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}