import 'dart:math';

import 'package:flutter/material.dart';

//application colors
const Color appBarBackgroundColor = Color(0xFF147CD3);
const Color bodyBackgroundColor = Color(0xFF2196F3);
const Color buttonColor = Color(0xFF147CD3);
const Color textColor = Colors.white;

//templates for all btns
ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: buttonColor,
  foregroundColor: textColor,
  shape: RoundedRectangleBorder(),
  minimumSize: Size(double.infinity, 50),
  elevation: 0,
  textStyle: TextStyle(fontSize: 16),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assigment 1',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(title: 'Random Number Generator'),
    );
  }
}

//home page
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _randomNum = 0;

  // count of random generated numbers in the collection
  final Map<int, int> _listOfNumbers = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0,
  };

  //generate random number & increment number counts
  void _generateNumber() {
    setState(() {
      _randomNum = Random().nextInt(9) + 1;

      //increments the number count in the map
      _listOfNumbers[_randomNum] = _listOfNumbers[_randomNum]! + 1;
    });
  }

  //navigate to stat page and pass a collection of number
  void _viewStat() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) =>
            StatPage(listOfNums: _listOfNumbers, reset: _reset),
      ),
    );
  }

  // reset to initial state
  void _reset() {
    setState(() {
      _randomNum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.home, color: textColor),
          onPressed: () {},
        ),
        title: Text(widget.title, style: TextStyle(color: textColor)),
      ),
      body: Column(
        children: [
          //Displays a randomly generated number or space as a intial state. takes all avaible space
          Expanded(
            child: Center(
              child: _randomNum == 0
                  ? Text("")
                  : Text(
                      '$_randomNum',
                      style: TextStyle(color: textColor, fontSize: 80),
                    ),
            ),
          ),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _generateNumber,
            child: const Text('Generate'),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _viewStat,
            child: const Text('View Statistics'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

//page that displays a collection of numbers and their count, buttons: reset and back to Home Page
class StatPage extends StatefulWidget {
  final Map<int, int> listOfNums;
  final VoidCallback reset;

  const StatPage({super.key, required this.listOfNums, required this.reset});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  void _reset() {
    setState(() {
      for (var key in widget.listOfNums.keys) {
        widget.listOfNums[key] = 0;
      }
      widget.reset();
    });
  }

  void _backToHome() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: _backToHome,
        ),
        title: Text('Statistics', style: TextStyle(color: textColor)),
      ),
      body: Column(
        children: [
          // display a collection of numbers and their count, takes all avaible space
          Expanded(
            child: ListView(
              children: widget.listOfNums.entries.map((entry) {
                return ListTile(
                  title: Text(
                    'Number ${entry.key}',
                    style: TextStyle(color: textColor),
                  ),
                  trailing: Text(
                    'Count: ${entry.value}',
                    style: TextStyle(color: textColor),
                  ),
                );
              }).toList(),
            ),
          ),

          //display button to reset the collection to its initial state
          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _reset,
            child: const Text('Reset'),
          ),

          const SizedBox(height: 10),

          //display btn to naviagte back home
          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: _backToHome,
            child: const Text('Back to Home'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
