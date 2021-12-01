use std::env;
use std::fs::File;
use std::io::BufReader;
use std::io::BufRead;

fn main() {
    let args: Vec<String> = env::args().collect();
    let query = &args[1];
    let filename = &args[2];
    if query == "day1" {
        let t_case: Vec<i64> = vec![199,200,208,210,200,207,240,269,260,263];
        let t_pt1 = day1_pt1(&t_case);
        let t_pt2 = day1_pt2(&t_case);
        println!("Test pt1 {}", t_pt1);
        println!("test pt2 {}", t_pt2);

        let data = read_i64_from_file(filename);
        let total = day1_pt1(&data);
        println!("Total is {}", total);
        let total_pt2 = day1_pt2(&data);
        println!("Total for part 2 is {}", total_pt2);
    }
}

//day 1 pt 2: Sliding windows 
fn day1_pt2(arr: &Vec<i64>) -> i64 {
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
fn day1_pt1(arr: &Vec<i64>) -> i32 {
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

// Write function to handle i64 type
fn read_i64_from_file(file_path: &str) -> Vec<i64> {
    let file = File::open(file_path).expect("File not found!");
    let reader = BufReader::new(file);
    let numbers: Vec<i64> = reader
        .lines()
        .map(|line| line.unwrap().parse::<i64>().unwrap())
        .collect();
    return numbers;
}