import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  Color _numberColor() {
    if (_counter == 0) return Colors.red;        
    if (_counter > 50) return Colors.green;      
    return Colors.orange;                        
  }

  @override
  Widget build(BuildContext context) {
    final liftoff = _counter == 100;

    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch')),
      body: Stack(
        children: [
          if (liftoff)
            Positioned.fill(
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    'assets/confetti.gif',    
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon(
                Icons.flight_takeoff,
                size: 60,
                color: Colors.blue,
              ),

              Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: _counter == 0
                      ? Colors.red
                      : _counter > 50
                          ? Colors.green
                          : Colors.orange,
                ),
              ),

              const SizedBox(height: 12),

              if (liftoff)
                const Text(
                  'LIFTOFF!',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                ),

              const SizedBox(height: 20),


              Slider(
                min: 0,
                max: 100,
                value: _counter.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    _counter = value.toInt();
                  });
                },
                activeColor: Colors.blue,
                inactiveColor: Colors.red,
              
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Ignite'),
                  ),
                  SizedBox(width: 40),  
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Decrement'),
                  ),
                ],
              ),

              
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Abort'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}