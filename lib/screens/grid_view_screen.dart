import 'package:flutter/material.dart';
import '../common/my_button.dart'; // Import the MyButton class

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final String name = "Aashista";
  List<ButtonState> buttonStates = []; // Initialize as empty list
  int currentIndex = 0; // Track the index of the next visible button

  @override
  void initState() {
    super.initState();
    buttonStates = List.generate(name.length, (index) => ButtonState.visible);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Screen'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: name.length, // Use name.length for dynamic count
        itemBuilder: (context, index) {
          return MyButton(
            letter: name[index],
            state: buttonStates[index],
            onPressed: () {
              setState(() {
                if (buttonStates[index] == ButtonState.visible) {
                  buttonStates[index] = ButtonState.pressed;
                } else if (buttonStates[index] == ButtonState.pressed) {
                  buttonStates[index] = ButtonState.inactive;

                  // Find the next visible button
                  currentIndex = (index + 1) % name.length;
                  while (buttonStates[currentIndex] == ButtonState.inactive) {
                    currentIndex = (currentIndex + 1) % name.length;
                  }
                  buttonStates[currentIndex] = ButtonState.visible;
                }
              });
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
