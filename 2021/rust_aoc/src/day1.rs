//day 1 pt 2: Sliding windows 
pub fn day1_pt2(arr: &Vec<i64>) -> i64 {
    let mut index = 0;
    let mut inc :i64 = 0; 
    // first loop get everyting into a vector 
    let mut n_arr: Vec<i64> = Vec::new(); 
    while index < arr.len() - 2{
        let tots = arr[index..=index+2].iter().sum();
        n_arr.push(tots);
        index = index + 1;
    }
    index = 1;
    while index < n_arr.len(){
        let diff = &n_arr[index] - &n_arr[index-1];
        if diff > 0 {
            inc = inc + 1;
        }
        index = index + 1;
    }
    return inc
}
// day 1: Take an array of numbers and calculate the number of times 
// the subsequent element increased compared to the first one 
pub fn day1_pt1(arr: &Vec<i64>) -> i32 {
    let mut index = 1;
    let mut inc :i32 = 0; 
    while index < arr.len(){
        let diff = &arr[index] - &arr[index-1];
        if diff > 0 {
            inc = inc + 1;
        }
        index = index + 1;
    }
    return inc
}