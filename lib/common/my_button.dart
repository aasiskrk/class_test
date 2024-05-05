import 'package:flutter/material.dart';

enum ButtonState { visible, pressed, inactive }

class MyButton extends StatelessWidget {
  final String letter;
  final ButtonState state;
  final VoidCallback onPressed;

  MyButton({
    required this.letter,
    required this.state,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    if (state == ButtonState.visible) {
      color = Colors.blue;
    } else if (state == ButtonState.pressed) {
      color = Colors.green; // Change to a different color for pressed
    } else {
      color = Colors.grey; // Use grey for inactive state
    }

    return ElevatedButton(
      onPressed: state == ButtonState.visible
          ? onPressed
          : null, // Disable for inactive
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(letter),
    );
  }
}
