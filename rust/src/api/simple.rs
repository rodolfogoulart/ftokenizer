
use std::path::PathBuf;
use flutter_rust_bridge::frb;
use rust_tokenizers::tokenizer::{BertTokenizer, Tokenizer, TruncationStrategy};
// use rust_tokenizers::vocab::{BertVocab, Vocab, SpecialTokenMap};
// use rust_tokenizers::vocab::{BertVocab, Vocab, SpecialTokenMap};
// use rust_tokenizers::vocab::BaseVocab::SpecialTokenMap;
// use rust_tokenizers::vocab::{BertVocab, Vocab, BaseVocab};
// use rust_tokenizers::vocab::BaseVocab::SpecialTokenMap;
use rust_tokenizers::vocab::*;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

// #[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
// /// Returns a Vec<i64>
// /// 
// /// # Arguments
// /// * `text` - The text to tokenize
// /// 
// /// use as default:
// /// * vocab path `vocab/vocab.txt`
// /// * max_len 256
// /// * lowercase false
// /// * strip_accents false
// pub fn bert_tokenizer256default(text: &str, vocab_path: &str) -> Vec<i64> {
//     let token = bert_tokenizer(text, 256, false, false, vocab_path);
//     return token;
// }

// fn load_bert_vocab(lowercase: bool, strip_accents: bool, vocab_path: &str) -> BertTokenizer{
//     let path: PathBuf = PathBuf::from(vocab_path);
//     if path.exists() {
//         if path.ends_with("txt"){
//             let vocab: BertVocab = match BertVocab::from_file(&path.as_path()) {
//                         Ok(vocab) => vocab,
//                         Err(e) => panic!("Error reading vocab file: {}", e), 
//                     };             
                    
//             let bert_tokenizer = BertTokenizer::from_existing_vocab(vocab, lowercase, strip_accents);            
            
//             return bert_tokenizer;
//         }else{
//             panic!("vocab.txt file not found");
//         }
        
        
//     }else{
//         panic!("Vocab file not found");
//     }
// }

// #[flutter_rust_bridge::frb(sync)] 
// pub fn bert_tokenizer_batch(text_batch: Vec<String>, max_len: usize, lowercase: bool, strip_accents: bool, vocab_path: &str ) -> Vec<Vec<i64>>{

//     let bert_tokenizer = load_bert_vocab(lowercase, strip_accents, vocab_path);
//     let mut batch:Vec<Vec<i64>>  = Vec::new();

//     for t in text_batch {
//         let test_sentence = t;
//         let encoding = bert_tokenizer.encode(
//         &test_sentence,
//         None,
//         max_len,
//         &TruncationStrategy::LongestFirst,
//         0,
//         );
//         batch.push(encoding.token_ids);
//     }

//     return batch;
// }


// #[flutter_rust_bridge::frb(sync)] 
// pub fn bert_tokenizer(text: &str, max_len: usize, lowercase: bool, strip_accents: bool, vocab_path: &str ) -> Vec<i64>{

//     let bert_tokenizer = load_bert_vocab(lowercase, strip_accents, vocab_path);
//     let test_sentence = text.to_string();
//     let encoding = bert_tokenizer.encode(
//         &test_sentence,
//         None,
//         max_len,
//         &TruncationStrategy::LongestFirst,
//         0
//     );    
//     // println!("{:?}", encoding);    
//     return encoding.token_ids;    
// }