use rust_tokenizers::{
    tokenizer::{BertTokenizer, Tokenizer, TruncationStrategy},
    TokenizedInput,
};
use std::{ops::Deref, path::PathBuf};
// use rust_tokenizers::vocab::{BertVocab, Vocab, SpecialTokenMap};
// use rust_tokenizers::vocab::{BertVocab, Vocab, SpecialTokenMap};
// use rust_tokenizers::vocab::BaseVocab::SpecialTokenMap;
use rust_tokenizers::vocab::{BertVocab, Vocab};
// use rust_tokenizers::vocab::BaseVocab::SpecialTokenMap;
// use rust_tokenizers::{vocab::Vocab, BertVocab, TokenizedInput};

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
// #[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
// pub fn tokenizer256default(text: &str, vocab_path: &str) -> Vec<i64> {
//     let token = tokenizer(text, 256, false, false, vocab_path);
//     return token;
// }

// // #[frb(sync)]
// struct Bert {
//     pub vocab: BertVocab,
//     pub bert_tokenizer: BertTokenizer,

// }
// #[frb]
// impl Bert {
//     pub fn load_vocab(
//         &mut self,
//         lowercase: bool,
//         strip_accents: bool,
//         vocab_path: &str,
//     ) {

//         let path: PathBuf = PathBuf::from(vocab_path);
//         if path.exists() {
//             if path.ends_with("txt") {
//                 // self.vocab = match BertVocab::from_file(&path.as_path()) {
//                 //     Ok(vocab) => vocab,
//                 //     Err(e) => panic!("Error reading vocab file: {}", e),
//                 // };
//                 self.vocab = BertVocab::from_file(&path.as_path()).unwrap();

//                 self.bert_tokenizer =
//                     BertTokenizer::from_existing_vocab(self.vocab.clone(), lowercase, strip_accents);

//                 // return self.bert_tokenizer;
//             } else {
//                 panic!("vocab.txt file not found");
//             }
//         } else {
//             panic!("Vocab file not found");
//         }
//     }

//     #[flutter_rust_bridge::frb(sync)]
//     //todo: Add text_2
//     pub fn tokenizer_batch(
//         &mut self,
//         text_batch: Vec<String>,
//         max_len: usize,
//         lowercase: bool,
//         strip_accents: bool,
//         vocab_path: &str,
//     ) -> Vec<Vec<i64>> {
//         self.load_vocab(lowercase, strip_accents, vocab_path);
//         let mut batch: Vec<Vec<i64>> = Vec::new();

//         for text_sentence in text_batch {
//             let encoding: TokenizedInput = self.bert_tokenizer.encode(
//                 &text_sentence,
//                 None,
//                 // Some(&text_2),
//                 max_len,
//                 &TruncationStrategy::LongestFirst,
//                 0,
//             );
//             batch.push(encoding.token_ids);
//         }

//         return batch;
//     }

//     #[flutter_rust_bridge::frb(sync)]
//     pub fn tokenizer(
//         &mut self,
//         text: &str,
//         text_2: Option<String>,
//         max_len: usize,
//         lowercase: bool,
//         strip_accents: bool,
//         vocab_path: &str,
//     ) -> Vec<i64> {
//         self.load_vocab(lowercase, strip_accents, vocab_path);
//         let test_sentence = text.to_string();

//         let encoding = match text_2 {
//             Some(text_2) => {
//                 let t2 = text_2.deref();
//                 self.bert_tokenizer.encode(
//                     &test_sentence,
//                     Some(t2),
//                     max_len,
//                     &TruncationStrategy::LongestFirst,
//                     0,
//                 )
//             }
//             None => self.bert_tokenizer.encode(
//                 &test_sentence,
//                 None,
//                 max_len,
//                 &TruncationStrategy::LongestFirst,
//                 0,
//             ),
//         };
//         // let encoding = bert_tokenizer.encode(
//         //     &test_sentence,
//         //     match text_2 {
//         //         Some(&text_2) => Some(text_2),
//         //         None => None
//         //     },
//         //     max_len,
//         //     &TruncationStrategy::LongestFirst,
//         //     0
//         // );
//         // println!("{:?}", encoding);
//         return encoding.token_ids;
//     }
// }

fn load_vocab(lowercase: bool, strip_accents: bool, vocab_path: &str) -> BertTokenizer {
    let path: PathBuf = PathBuf::from(vocab_path);    
    if path.exists() {
        // print!("ends_with(txt): {}", path.extension("txt").unwrap());
        // print!("ends_with(.txt): {}", path.ends_with(".txt"));
        // if path.extension().unwrap() == "txt" {
        // self.vocab = match BertVocab::from_file(&path.as_path()) {
        //     Ok(vocab) => vocab,
        //     Err(e) => panic!("Error reading vocab file: {}", e),
        // };
        let vocab = BertVocab::from_file(&path.as_path()).unwrap();

        let bert_tokenizer = BertTokenizer::from_existing_vocab(vocab, lowercase, strip_accents);

        return bert_tokenizer;
        // } else {
        //     panic!("vocab.txt file not found");
        // }
    } else {
        panic!("Vocab file not found");
    }
}

#[flutter_rust_bridge::frb(sync)]
//todo: Add text_2
pub fn tokenizer_batch(
    text_batch: Vec<String>,
    max_len: usize,
    lowercase: bool,
    strip_accents: bool,
    vocab_path: &str,
) -> Vec<Vec<i64>> {
    let bert_tokenizer = load_vocab(lowercase, strip_accents, vocab_path);
    let mut batch: Vec<Vec<i64>> = Vec::new();

    for text_sentence in text_batch {
        let encoding: TokenizedInput = bert_tokenizer.encode(
            &text_sentence,
            None,
            // Some(&text_2),
            max_len,
            &TruncationStrategy::LongestFirst,
            0,
        );
        batch.push(encoding.token_ids);
    }

    return batch;
}

/// # Truncation strategy variants
/// Indicates if and how sequence pairs exceeding a given length should be truncated
#[flutter_rust_bridge::frb(sync)]
pub enum Truncation {
    /// Truncate the longest sequence first
    LongestFirst,
    /// Truncate only the first sequence
    OnlyFirst,
    /// Truncate only the second sequence
    OnlySecond,
    /// Do not truncate the sequences
    DoNotTruncate,
}

fn get_truncation_strategy(truncation:Truncation) -> TruncationStrategy {
    match truncation {
        Truncation::LongestFirst => TruncationStrategy::LongestFirst,
        Truncation::OnlyFirst => TruncationStrategy::OnlyFirst,
        Truncation::OnlySecond => TruncationStrategy::OnlySecond,
        Truncation::DoNotTruncate => TruncationStrategy::DoNotTruncate,
    }
}

#[flutter_rust_bridge::frb(sync)]
pub fn tokenizer(
    text: &str,
    text_2: Option<String>,
    max_len: usize,
    lowercase: bool,
    strip_accents: bool,
    vocab_path: &str,
    truncation_strategy: Truncation,
) -> Vec<i64> {
    let bert_tokenizer = load_vocab(lowercase, strip_accents, vocab_path);
    let test_sentence = text.to_string();
    
    let encoding = match text_2 {
        Some(text_2) => {
            let t2 = text_2.deref();
            bert_tokenizer.encode(
                &test_sentence,
                Some(t2),
                max_len,
                &get_truncation_strategy(truncation_strategy),
                // &TruncationStrategy::LongestFirst,
                0,
            )
        }
        None => bert_tokenizer.encode(
            &test_sentence,
            None,
            max_len,
            &TruncationStrategy::LongestFirst,
            0,
        ),
    };
    // let encoding = bert_tokenizer.encode(
    //     &test_sentence,
    //     match text_2 {
    //         Some(&text_2) => Some(text_2),
    //         None => None
    //     },
    //     max_len,
    //     &TruncationStrategy::LongestFirst,
    //     0
    // );
    // println!("{:?}", encoding);
    return encoding.token_ids;
}
