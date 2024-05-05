import 'package:flutter/material.dart';

class CLASStext extends StatelessWidget {
  const CLASStext({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    
    
 debugShowCheckedModeBanner: false;,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GridViewScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          ,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  final String name = "Aayush";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Screen"),
      ),
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: name.length,
          children: List.generate(name.length, (index) {
            return MyButton(index);
          }),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  final int index;

  MyButton(this.index);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.pressed)
                  ? Colors.blueAccent
                  : Colors.green;
            },
          ),
        ),
        child: Text(
          "Button ${widget.index + 1}",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}