# ftokenizer

Flutter Tokenizer for NLP models

## Usage

ensure to add init

```dart
   await FTokenizer.init();
```

and to dispose

```dart
    FTokenizer.dispose();
```

If using on with `Isolate`, make shure to call `await FTokenizer.init();`on the begin and`FTokenizer.dispose();` before close the Isolate

> FTokenizer uses [rust_tokenizer](https://crates.io/crates/rust_tokenizers)
> See the rust_tokenizer description:
> Rust-tokenizer is a drop-in replacement for the tokenization methods from the Transformers library It includes a broad range of tokenizers for state-of-the-art transformers architectures, including:
> Sentence Piece (unigram model)
>
> Sentence Piece (BPE model)
>
> BERT
>
> ALBERT
>
> DistilBERT
>
> RoBERTa
>
> GPT
>
> GPT2
>
> ProphetNet
>
> CTRL
>
> Pegasus
>
> MBart50
>
> M2M100
>
> NLLB
>
> DeBERTa
>
> DeBERTa (v2)
>
> The wordpiece based tokenizers include both single-threaded and multi-threaded processing. The Byte-Pair-Encoding tokenizers favor the use of a shared cache and are only available as single-threaded tokenizers Using the tokenizers requires downloading manually the tokenizers required files (vocabulary or merge files). These can be found in the Transformers library.
