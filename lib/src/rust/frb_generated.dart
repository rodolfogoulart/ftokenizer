// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {
    await api.crateApiSimpleInitApp();
  }

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.6.0';

  @override
  int get rustContentHash => -1255438299;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'ftokenizer',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Int64List crateApiSimpleBertTokenizer(
      {required String text,
      required BigInt maxLen,
      required bool lowercase,
      required bool stripAccents,
      required String vocabPath});

  Int64List crateApiSimpleBertTokenizer256Default(
      {required String text, required String vocabPath});

  List<Int64List> crateApiSimpleBertTokenizerBatch(
      {required List<String> textBatch,
      required BigInt maxLen,
      required bool lowercase,
      required bool stripAccents,
      required String vocabPath});

  Future<void> crateApiSimpleInitApp();
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Int64List crateApiSimpleBertTokenizer(
      {required String text,
      required BigInt maxLen,
      required bool lowercase,
      required bool stripAccents,
      required String vocabPath}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(text, serializer);
        sse_encode_usize(maxLen, serializer);
        sse_encode_bool(lowercase, serializer);
        sse_encode_bool(stripAccents, serializer);
        sse_encode_String(vocabPath, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 1)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_list_prim_i_64_strict,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleBertTokenizerConstMeta,
      argValues: [text, maxLen, lowercase, stripAccents, vocabPath],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleBertTokenizerConstMeta =>
      const TaskConstMeta(
        debugName: "bert_tokenizer",
        argNames: ["text", "maxLen", "lowercase", "stripAccents", "vocabPath"],
      );

  @override
  Int64List crateApiSimpleBertTokenizer256Default(
      {required String text, required String vocabPath}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(text, serializer);
        sse_encode_String(vocabPath, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 2)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_list_prim_i_64_strict,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleBertTokenizer256DefaultConstMeta,
      argValues: [text, vocabPath],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleBertTokenizer256DefaultConstMeta =>
      const TaskConstMeta(
        debugName: "bert_tokenizer256default",
        argNames: ["text", "vocabPath"],
      );

  @override
  List<Int64List> crateApiSimpleBertTokenizerBatch(
      {required List<String> textBatch,
      required BigInt maxLen,
      required bool lowercase,
      required bool stripAccents,
      required String vocabPath}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_list_String(textBatch, serializer);
        sse_encode_usize(maxLen, serializer);
        sse_encode_bool(lowercase, serializer);
        sse_encode_bool(stripAccents, serializer);
        sse_encode_String(vocabPath, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 3)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_list_list_prim_i_64_strict,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleBertTokenizerBatchConstMeta,
      argValues: [textBatch, maxLen, lowercase, stripAccents, vocabPath],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleBertTokenizerBatchConstMeta =>
      const TaskConstMeta(
        debugName: "bert_tokenizer_batch",
        argNames: [
          "textBatch",
          "maxLen",
          "lowercase",
          "stripAccents",
          "vocabPath"
        ],
      );

  @override
  Future<void> crateApiSimpleInitApp() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 4, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleInitAppConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleInitAppConstMeta => const TaskConstMeta(
        debugName: "init_app",
        argNames: [],
      );

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  PlatformInt64 dco_decode_i_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeI64(raw);
  }

  @protected
  List<String> dco_decode_list_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_String).toList();
  }

  @protected
  List<Int64List> dco_decode_list_list_prim_i_64_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>)
        .map(dco_decode_list_prim_i_64_strict)
        .toList();
  }

  @protected
  Int64List dco_decode_list_prim_i_64_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeInt64List(raw);
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  PlatformInt64 sse_decode_i_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getPlatformInt64();
  }

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <String>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_String(deserializer));
    }
    return ans_;
  }

  @protected
  List<Int64List> sse_decode_list_list_prim_i_64_strict(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <Int64List>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_list_prim_i_64_strict(deserializer));
    }
    return ans_;
  }

  @protected
  Int64List sse_decode_list_prim_i_64_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getInt64List(len_);
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void sse_encode_i_64(PlatformInt64 self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putPlatformInt64(self);
  }

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_String(item, serializer);
    }
  }

  @protected
  void sse_encode_list_list_prim_i_64_strict(
      List<Int64List> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_list_prim_i_64_strict(item, serializer);
    }
  }

  @protected
  void sse_encode_list_prim_i_64_strict(
      Int64List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putInt64List(self);
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }
}
