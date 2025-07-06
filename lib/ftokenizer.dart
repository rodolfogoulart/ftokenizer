library ftokenizer;

// import 'package:ftokenizer/ftokenizer.dart';
import 'package:flutter_rust_bridge/src/generalized_typed_data/_io.dart';

import 'src/rust/api/bert.dart';
import 'src/rust/frb_generated.dart' show RustLib;

// class BertModel implements Bert {

// }

class FTokenizer {
  static final instance = FTokenizer._();
  FTokenizer._();

  static String pathVocab = "vocab/vocab.txt";

  static Future<void> init() => RustLib.init();

  // static List<int> getBertTokens256Default(String text, {String? vocabPath}) =>
  //     Bert().tokenizer256Default(text: text, vocabPath: vocabPath ?? pathVocab).map((i) => i.toInt()).toList();

  static List<int> getBertTokens({
    required String text,
    String? text2,
    required int maxLen,
    required bool lowercase,
    required bool stripAccents,
    String? vocabPath,
  }) =>
      tokenizer(
        text: text,
        text2: text2,
        maxLen: BigInt.from(maxLen),
        lowercase: lowercase,
        stripAccents: stripAccents,
        vocabPath: vocabPath ?? pathVocab,
        truncationStrategy: TruncationStrategy.
      ).map((i) => i.toInt()).toList();

  static List<List<int>> getBertTokensBatch({
    required List<String> textBatch,
    required int maxLen,
    required bool lowercase,
    required bool stripAccents,
    required String? vocabPath,
  }) =>
      tokenizerBatch(
        textBatch: textBatch,
        maxLen: BigInt.from(maxLen),
        lowercase: lowercase,
        stripAccents: stripAccents,
        vocabPath: vocabPath ?? pathVocab,
      ).map((i) => i.map((e) => e.toInt()).toList()).toList();

  static void dispose() => RustLib.dispose();
}
