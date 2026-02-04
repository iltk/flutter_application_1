import 'package:flutter/material.dart';

//define application colors
const Color appBarBackgroundColor = Color(0xFF147CD3);
const Color bodyBackgroundColor = Color(0xFF2196F3);
const Color buttonColor = Color(0xFF147CD3);
const Color textColor = Colors.white;

// define template for all btns
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

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: Icon(Icons.home, color: textColor),
        title: Text(widget.title, style: TextStyle(color: textColor)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                '7',
                style: TextStyle(color: textColor, fontSize: 80),
              ),
            ),
          ),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: () {},
            child: const Text('Generate'),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            style: _elevatedButtonStyle,
            onPressed: () {},
            child: const Text('View Statistics'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
