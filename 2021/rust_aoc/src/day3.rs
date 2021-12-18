use std::collections::HashMap;

pub fn calc_gamma(arr: Vec<String>){
    let t_len: &usize = &arr[0].chars().count();
    let mut g_store :Vec<&str> = Vec::new();
    for i in 1..=(t_len - 1) {
        let arr_iter = arr.iter();
        for val in arr_iter {
            g_store.push(&val[i-1..i]);
        }
    }
}

fn pick_common(arr: Vec<String>){
    let mut count: Hashmap<String,i64> = HashMap::new();
    
}



pub fn convert_binary(){

}