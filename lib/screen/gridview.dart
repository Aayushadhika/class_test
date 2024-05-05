import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<String> buttonLetters = ['A', 'y', 'u', 's', 'H'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: buttonLetters.map((letter) {
          return MyButton(
            letter: letter,
            onPressed: () {
              setState(() {
                buttonLetters.remove(letter);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  final String letter;
  final Function() onPressed;

  MyButton({required this.letter, required this.onPressed});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _clicked = !_clicked;
          widget.onPressed();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _clicked ? Colors.red : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.letter,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}