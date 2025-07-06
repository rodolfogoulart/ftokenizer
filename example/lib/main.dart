import 'dart:io';

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
  getDuration(Function() fn) {
    Stopwatch stopwatch = Stopwatch()..start();
    fn.call();
    stopwatch.stop();
    setState(() {
      tokens = 'duration: ${stopwatch.elapsedMilliseconds} ms\n$tokens';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FTokenizer quickstart')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                onSubmitted: (value) {},
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        getDuration(
                          () {
                            setState(() {
                              if (File('./vocab/vocab.txt').existsSync()) print('existe');

                              var batch = FTokenizer.getBertTokens(
                                  text: _controller.text,
                                  text2: null,
                                  maxLen: 256,
                                  lowercase: true,
                                  stripAccents: false,
                                  vocabPath: './vocab/vocab.txt');

                              tokens = batch.toString();
                            });
                          },
                        );
                      },
                      child: Text('Bert Unique Token')),
                  ElevatedButton(
                      onPressed: () {
                        getDuration(() {
                          setState(() {
                            // tokens = FTokenizer.getBertTokens256Default(value).toString();
                            List<String> toBatch = List.generate(1000, (i) => 'tokens $i');
                            if (File('./vocab/vocab.txt').existsSync()) print('existe');

                            var batch = FTokenizer.getBertTokensBatch(
                                textBatch: toBatch,
                                maxLen: 256,
                                lowercase: true,
                                stripAccents: false,
                                vocabPath: './vocab/vocab.txt');

                            tokens = batch.toString();
                          });
                        });
                      },
                      child: Text('Bert Batch Token')),
                ],
              ),
              Center(
                child: Text('Result: $tokens'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
