import 'package:flutter/material.dart';
import 'package:ftokenizer/ftokenizer.dart';

Future<void> main() async {
  //! Important: call this first when using FTokenizer
  await FTokenizer.init();

  //if using on a Isolate call
  // await FTokenizer.init();
  // FTokenizer.dispose();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String tokens = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FTokenizer quickstart')),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                setState(() {
                  tokens = FTokenizer.getBertTokens256Default(value).toString();
                });
              },
            ),
            Center(
              child: Text('Result: $tokens'),
            ),
          ],
        ),
      ),
    );
  }
}
