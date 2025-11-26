fn branch(l: &Vec<u32>, index: u32, g_l: &mut Vec<Vec<u32>>) {
    let len: u32 = l.len() as u32;
    let sum: u32 = l.iter().sum::<u32>();

    let mut l1 = l.clone();
    if sum == 70 && len == 6 {
        g_l.push(l1);
        return;
    }
    if sum > 70 || len >= 6 || index > 45 {
        return;
    }

    branch(l, index + 1, g_l);
    l1.push(index);
    branch(&l1, index + 1, g_l);
}

fn main() {
    let mut g_l: Vec<Vec<u32>> = Vec::new();
    let l: Vec<u32> = Vec::new();

    branch(&l, 1, &mut g_l);

    let mut count: u32 = 1;
    g_l.sort();
    for i in g_l.iter() {
        print!("{} : ", count);
        println!(
            "{}",
            i.iter()
                .map(|x| x.to_string())
                .collect::<Vec<_>>()
                .join(" ")
        );
        count += 1;
    }
}
