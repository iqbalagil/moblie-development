import 'package:flutter/material.dart';
import 'package:flutter_crud/common_widget/round_button.dart';

class TemperatureConverter extends StatefulWidget {
  
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
double celsiusToFahrenheit(double celsius) {
  return (celsius * 9/5) + 32;
}

double celsiusToReaumur(double celsius) {
  return celsius * 4/5;
}

double celsiusToKelvin(double celsius) {
  return celsius + 273.15;
}

  final TextEditingController _controller = TextEditingController();
  double _fahrenheit = 0;
  double _reaumur = 0;
  double _kelvin = 0;

  void _convertTemperature() {
    double celsius = double.tryParse(_controller.text) ?? 0;
    setState(() {
      _fahrenheit = celsiusToFahrenheit(celsius);
      _reaumur = celsiusToReaumur(celsius);
      _kelvin = celsiusToKelvin(celsius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Temperature")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter temperature in Celsius",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            RoundButton(
              title: "Convert",
              onPressed: _convertTemperature,
              type: RoundButtonType.bgGradient,
            ),
            const SizedBox(height: 20),
            Text("Fahrenheit: $_fahrenheit"),
            Text("Reaumur: $_reaumur"),
            Text("Kelvin: $_kelvin"),
          ],
        ),
      ),
    );
  }
}
