/*
 * Day 2 of advent of code, written in Rust
 *
 * Josh Jeppson
 * */

use std::fs::File;
use std::io::{BufRead, BufReader};

const OP_ROCK : &str = "A";
const OP_PAPER : &str = "B";
const OP_SCISSORS : &str  = "C";

const ROCK : &str = "X";
const PAPER : &str  = "Y";
const SCISSORS : &str = "Z";

fn main() {
    println!("Day 2 advent of code solution.");
    let filename = "day2.txt";

    let file = File::open(filename).unwrap();
    let reader = BufReader::new(file);

    let mut totalScore = 0;
    let mut totalScorePart2 = 0;
    // Read each line in the file
    for (_index, line) in reader.lines().enumerate() {
        let line = line.unwrap();
        // First input is their hand, second is mine
        let plays = line.split(" ").collect::<Vec<&str>>();
        if plays.len() == 2 {
            let opponent = plays[0];
            let mine = plays[1];
            let (mut win, mut lose, mut draw) : (&str, &str, &str);
            win = "";
            lose = "";
            draw = "";
            if mine == ROCK {
                totalScore += 1;
                // "X" means lose for part 2, so no other additions are made here
                if opponent == OP_ROCK {
                    // We must choose scissors to lose
                    totalScorePart2 += 3;
                }
                else if opponent == OP_SCISSORS {
                    // We must choose paper to lose
                    totalScorePart2 += 2;
                }
                else { // OP_PAPER
                    // We must choose rock to lose
                    totalScorePart2 += 1;
                }
            }
            else if mine == PAPER {
                totalScore += 2;
                // "Y" means draw, so we add 3 points
                totalScorePart2 += 3;
                if opponent == OP_ROCK {
                    // We must choose rock to draw
                    totalScorePart2 += 1;
                }
                else if opponent == OP_SCISSORS {
                    // We must choose scissors to draw
                    totalScorePart2 += 3;
                }
                else { // OP_PAPER
                    // We must choose paper to draw
                    totalScorePart2 += 2;
                }

            }
            else if mine == SCISSORS {
                totalScore += 3;
                // "Z" means win, so we add 6 points
                totalScorePart2 += 6;
                if opponent == OP_ROCK {
                    // We must choose paper to win
                    totalScorePart2 += 2;
                }
                else if opponent == OP_SCISSORS {
                    // We must choose rock to win
                    totalScorePart2 += 1;
                }
                else { // OP_PAPER
                    // We must choose scissors to win
                    totalScorePart2 += 3;
                }
            }
            // Figure out what win lose and draw would be
            // Opponent chooses rock
            if opponent == OP_ROCK {
                draw = ROCK;
                win = PAPER;
                lose = SCISSORS; // Scissors
            }
            // Opponent chooses paper
            else if opponent == OP_PAPER {
                draw = PAPER;
                win = SCISSORS;
                lose = ROCK;
            }
            // Opponent chooses scissors
            else if opponent == OP_SCISSORS {
                draw = SCISSORS;
                win = ROCK;
                lose = PAPER;
            }
            else {
                println!("Warning, opponent does not match! {:?}", opponent);
            }
            // Calculate total score
            if mine == lose {
                println!("Lost for line {:?}", line);
            }
            else if mine == draw {
                println!("Got a draw for line {:?}", line);
                totalScore += 3
            }
            else if mine == win {
                println!("Got a win for line {:?}", line);
                totalScore += 6;
            }
            else {
                println!("Sanity check, should never get here, mine: {:?} op: {:?}", mine, opponent);
            }
        }
        else {
            println!("Error in parsing line {:?}", line);
        }
    }
    println!("Total score {:?}", totalScore);
    println!("Total score for part 2 {:?}", totalScorePart2);
}
