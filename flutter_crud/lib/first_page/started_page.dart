import 'package:flutter/material.dart';
import 'package:flutter_crud/common/color_widget.dart';
import 'package:flutter_crud/common_widget/round_button.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fahrenheit",style: TextStyle(color: Tcolor.black),),
                Text("$_fahrenheit", style: TextStyle(color: Tcolor.gray),),
                SizedBox.fromSize(size: const Size(20, 40),),
                Text("Reamur",style: TextStyle(color: Tcolor.black),),
                Text("$_reaumur", style: TextStyle(color: Tcolor.gray),),
                SizedBox.fromSize(size: const Size(20, 40),),
                Text("Kelvin",style: TextStyle(color: Tcolor.black),),
                Text("$_kelvin", style: TextStyle(color: Tcolor.gray),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
