// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Area Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Area Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double radius = 0; // The radius of the circle in meters
  double area = 0; // The area of the circle in square meters

  // A function to calculate the area of a circle using the formula
  // Area = π × r^2, where r is the radius
  void calculateArea() {
    area = Math.PI * radius * radius;
    setState(() {}); // Update the UI after calculation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('The area of the circle is $area square meters'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the radius of the circle in meters',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  radius = double.parse(value); // Parse the input value as a double
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateArea,
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
