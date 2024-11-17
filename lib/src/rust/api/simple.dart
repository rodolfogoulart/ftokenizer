// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `load_bert_vocab`

/// Returns a Vec<i64>
///
/// # Arguments
/// * `text` - The text to tokenize
///
/// use as default:
/// * vocab path `vocab/vocab.txt`
/// * max_len 256
/// * lowercase false
/// * strip_accents false
Int64List bertTokenizer256Default(
        {required String text, required String vocabPath}) =>
    RustLib.instance.api.crateApiSimpleBertTokenizer256Default(
        text: text, vocabPath: vocabPath);

List<Int64List> bertTokenizerBatch(
        {required List<String> textBatch,
        required BigInt maxLen,
        required bool lowercase,
        required bool stripAccents,
        required String vocabPath}) =>
    RustLib.instance.api.crateApiSimpleBertTokenizerBatch(
        textBatch: textBatch,
        maxLen: maxLen,
        lowercase: lowercase,
        stripAccents: stripAccents,
        vocabPath: vocabPath);

Int64List bertTokenizer(
        {required String text,
        required BigInt maxLen,
        required bool lowercase,
        required bool stripAccents,
        required String vocabPath}) =>
    RustLib.instance.api.crateApiSimpleBertTokenizer(
        text: text,
        maxLen: maxLen,
        lowercase: lowercase,
        stripAccents: stripAccents,
        vocabPath: vocabPath);
