pub fn cal_pos(arr: Vec<String>, trace:bool) -> i64 {
    let arr_iter = arr.iter(); 
    let mut h_pos = 0;
    let mut v_pos = 0;
    for val in arr_iter {
        let split :Vec<&str> = val.split(" ").collect();
        let value :i64 = split[1].parse::<i64>().unwrap();
        if split[0] == "forward" {
            h_pos = h_pos + value;
        } else if split[0] == "up" {
            v_pos = v_pos - value;
        } else if split[0] == "down" {
            v_pos = v_pos + value;
        }
        if trace {
            println!("Horizontal position {}, vertical position {}", h_pos, v_pos);
        }
    }
    println!("Final Horizontal position {}, vertical position {}", h_pos, v_pos);
    let res : i64 = h_pos * v_pos;
    return res
}

pub fn cal_pos_2(arr: Vec<String>, trace:bool) -> i64 {
    let arr_iter = arr.iter(); 
    let mut h_pos = 0;
    let mut v_pos = 0;
    let mut aim = 0; 
    for val in arr_iter {
        let split :Vec<&str> = val.split(" ").collect();
        let value :i64 = split[1].parse::<i64>().unwrap();
        if split[0] == "forward" {
            h_pos = h_pos + value;
            v_pos = v_pos + aim * value;
        } else if split[0] == "up" {
            aim = aim - value;
        } else if split[0] == "down" {
            aim = aim + value;
        }
        if trace {
            println!("Horizontal position {}, vertical position {}, aim {}", h_pos, v_pos, aim);
        }
    }
    println!("Final Horizontal position {}, vertical position {}", h_pos, v_pos);
    let res : i64 = h_pos * v_pos;
    return res
}