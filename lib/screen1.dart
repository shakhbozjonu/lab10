import 'package:flutter/material.dart';
import 'dart:math';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double _heartSize = 120.0;
  Color _textColor = Colors.white;
  List<Color> _availableColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];
  Random _random = Random();

  void _toggleHeartSize() {
    setState(() {
      _heartSize = _heartSize == 120.0 ? 200.0 : 120.0;
    });
  }

  void _changeTextColor() {
    setState(() {
      _textColor = _availableColors[_random.nextInt(_availableColors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _changeTextColor,
              child: Text(
                'Heartbeater!',
                style: TextStyle(
                  fontSize: 24,
                  color: _textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _toggleHeartSize,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _heartSize,
                height: _heartSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite,
                  size: _heartSize,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen2');
              },
              child: Text('SECOND'),
            ),
          ],
        ),
      ),
    );
  }
}