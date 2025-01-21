import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightFeetController = TextEditingController();
  final TextEditingController _heightInchesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _bmi;
  String _bmiCategory = "";
  Color _backgroundColor = Colors.blue;

  void _calculateBMI() {
    final double? heightFeet = double.tryParse(_heightFeetController.text);
    final double? heightInches = double.tryParse(_heightInchesController.text);
    final double? weight = double.tryParse(_weightController.text);

    if (heightFeet == null ||
        heightInches == null ||
        weight == null ||
        heightFeet <= 0 ||
        heightInches < 0 ||
        weight <= 0) {
      setState(() {
        _bmi = null;
        _bmiCategory = "Invalid input!";
        _backgroundColor = Colors.blue;
      });
      return;
    }

    // Convert height to inches and then to meters
    final double heightInMeters =
        ((heightFeet * 12) + heightInches) * 0.0254;

    setState(() {
      _bmi = weight / (heightInMeters * heightInMeters);

      if (_bmi! < 18.5) {
        _bmiCategory = "Underweight";
        _backgroundColor = Colors.lightBlueAccent;
      } else if (_bmi! >= 18.5 && _bmi! < 24.9) {
        _bmiCategory = "Normal weight";
        _backgroundColor = Colors.greenAccent;
      } else if (_bmi! >= 25 && _bmi! < 29.9) {
        _bmiCategory = "Overweight";
        _backgroundColor = Colors.orangeAccent;
      } else {
        _bmiCategory = "Obesity";
        _backgroundColor = Colors.redAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_backgroundColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'BMI Calculator',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _heightFeetController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Height (Feet)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: const Icon(Icons.height),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            controller: _heightInchesController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Height (Inches)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: const Icon(Icons.height),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(Icons.monitor_weight),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _calculateBMI,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Calculate BMI',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    if (_bmi != null)
                      Column(
                        children: [
                          Text(
                            'Your BMI: ${_bmi!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Category: $_bmiCategory',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: _bmiCategory == "Normal weight"
                                  ? Colors.green
                                  : Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
