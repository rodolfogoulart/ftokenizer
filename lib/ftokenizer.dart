library ftokenizer;

// import 'package:ftokenizer/ftokenizer.dart';
import 'src/rust/api/simple.dart';
import 'src/rust/frb_generated.dart' show RustLib;

class FTokenizer {
  static final instance = FTokenizer._();
  FTokenizer._();

  static String pathVocab = "vocab/vocab.txt";

  static Future<void> init() => RustLib.init();

  static List<int> getBertTokens256Default(String text, {String? vocabPath}) =>
      bertTokenizer256Default(text: text, vocabPath: vocabPath ?? pathVocab).map((i) => i.toInt()).toList();

  static List<int> getBertTokens(
    String text,
    int maxLen,
    bool lowercase,
    bool stripAccents,
    String? vocabPath,
  ) =>
      bertTokenizer(
        text: text,
        maxLen: BigInt.from(maxLen),
        lowercase: lowercase,
        stripAccents: stripAccents,
        vocabPath: vocabPath ?? pathVocab,
      ).map((i) => i.toInt()).toList();

  static List<List<int>> getBertTokensBatch({
    required List<String> textBatch,
    required int maxLen,
    required bool lowercase,
    required bool stripAccents,
    required String? vocabPath,
  }) =>
      bertTokenizerBatch(
        textBatch: textBatch,
        maxLen: BigInt.from(maxLen),
        lowercase: lowercase,
        stripAccents: stripAccents,
        vocabPath: vocabPath ?? pathVocab,
      ).map((i) => i.map((e) => e.toInt()).toList()).toList();

  static void dispose() => RustLib.dispose();
}
