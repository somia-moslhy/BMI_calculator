import 'package:flutter/material.dart';

class CustomRestartButton extends StatefulWidget {
  const CustomRestartButton({super.key});

  @override
  State<CustomRestartButton> createState() => _CustomRestartButtonState();
}

class _CustomRestartButtonState extends State<CustomRestartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black,
        ),
        child: const Icon(
          Icons.restart_alt,
          color: Colors.grey,
          textDirection: TextDirection.rtl,
          size: 40,
        ),
      ),
    );
  }
}