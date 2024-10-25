fn f1() -> Bool {
    1 > 2
}

fn f2() -> Bool {
    1 + 1 == 2
}

test f3(){
    !f1()? && f2()?
}

test f4(){
    and{
        1000000 == 1_000_000, // True
        !False, // True
        or{ // True
            4 + 5 == 8, // False
            4 + 5 == 9 // True
        }
    }
}

test f5(){
    and{
        "foo" == #[0x66, 0x6f, 0x6f] && #[102, 111, 111] == #"666f6f",
        "666f6f" == #[0x36, 0x36, 0x36, 0x66, 0x36, 0x66] && "666f6f" == #[54, 54, 54, 102, 54, 102]
    }
}

test f6(){
    let x2 = [3, 4]
    [1, 2, .. x2] == [1, 2, 3, 4]
}

test f7(){
    let point = (4, 5)
    let x = point.1st
    let y = point.2nd
    x == 4 && y == 5
}

test f8(){
    let foo = Pair(14, "aiken")
 
    foo.1st == 14 && foo.2nd == "aiken"
}

type Option<a> {
  Some(a)
  None
}

fn get_age(x: Int) -> Option<Int> {
    if x < 0{
        None
    }else{
        Some(x)
    }
}

test f9(){
    let age = 21
    let aaa = get_age(age)
    when aaa is {
        Some(x) -> {
            x == age
        }
        None -> False
    }
}

/// Extract the first element of a list, if any.
fn get_head(xs: List<a>) -> Option<a> { 
  when xs is {
    [] -> None
    [head, ..] -> Some(head)
  }
}
 

test f10(){
    when get_head([5,4,3,2,1]) is{
        Some(head) -> {
            head == 5
        }
        None -> False
    }
}