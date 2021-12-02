use std::env;
use std::fs::File;
use std::io::BufReader;
use std::io::BufRead;
use rust_aoc::day1; 
use rust_aoc::day2; 

fn main() {
    let args: Vec<String> = env::args().collect();
    let query = &args[1];
    let filename = &args[2];
    if query == "day1" {
        let t_case: Vec<i64> = vec![199,200,208,210,200,207,240,269,260,263];
        let t_pt1 = day1::day1_pt1(&t_case);
        let t_pt2 = day1::day1_pt2(&t_case);
        println!("Test pt1 {}", t_pt1);
        println!("test pt2 {}", t_pt2);

        let data = read_i64(filename);
        let total = day1::day1_pt1(&data);
        println!("Total is {}", total);
        let total_pt2 = day1::day1_pt2(&data);
        println!("Total for part 2 is {}", total_pt2);
    } else if query == "day2" {
        let t_case: Vec<String> = vec!["forward 5", "down 5", 
                                        "forward 8", "up 3", "down 8", 
                                        "forward 2"].iter().map(|x| x.to_string()).collect();
        let data = read_str(filename);
        let t_case_2 = t_case.clone();
        let data_2 = data.clone();

        let t_pt1 = day2::cal_pos(t_case, true);
        let t_pt2 = day2::cal_pos_2(t_case_2, true);
        let total_pt1 = day2::cal_pos(data, false);
        let total_pt2 = day2::cal_pos_2(data_2, false);

        println!("Test pt 1 are {}", t_pt1);
        println!("Multiplier for pt.1 is {}", total_pt1);
        println!("Test pt 2 are {}", t_pt2);
        println!("Multiplier for pt.2 is {}", total_pt2);
    }
}


fn read_i64(file_path: &str) -> Vec<i64>{
    let file = File::open(file_path).expect("File not found!");
    let reader = BufReader::new(file);
    let numbers: Vec<i64> = reader
        .lines()
        .map(|line| line.unwrap().parse::<i64>().unwrap())
        .collect();
    return numbers;
}

fn read_str(file_path: &str) -> Vec<String> {
    let file = File::open(file_path).expect("File not found!");
    let reader = BufReader::new(file);
    let numbers: Vec<String> = reader
        .lines()
        .map(|line| line.unwrap()).collect::<Vec<_>>();
    return numbers;
}
