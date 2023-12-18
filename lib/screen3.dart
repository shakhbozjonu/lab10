import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  double _sliderValue = 24.0;
  bool _isSwitchOn = false;
  Color _backgroundColor = Colors.purple;

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _onSwitchChanged(bool value) {
    setState(() {
      _isSwitchOn = value;
      _backgroundColor = _isSwitchOn ? Colors.indigoAccent : Colors.purple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Play with me :)',
              style: TextStyle(
                fontSize: _sliderValue,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Slider(
              value: _sliderValue,
              onChanged: _onSliderChanged,
              activeColor: Colors.white,
              inactiveColor: Colors.white.withOpacity(0.5),
              min: 12.0,
              max: 48.0,
            ),
            SizedBox(height: 16),
            Switch(
              value: _isSwitchOn,
              onChanged: _onSwitchChanged,
              activeColor: Colors.white,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Go to Screen 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/screen2');
                  },
                  child: Text('Go to Screen 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}