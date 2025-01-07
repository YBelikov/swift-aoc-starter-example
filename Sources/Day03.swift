//
//  File.swift
//  swift-aoc-starter-example
//
//  Created by Yuriy Belikov on 05.01.2025.
//

import Foundation

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  func part1() -> Any {
    guard let mulOpRegex = try? Regex("mul\\(\\d+,\\d+\\)") else {
      return -1
    }
    let matches = data.matches(of: mulOpRegex)
    let partialResults = matches.map { regexMatch in
      let splitMulOp = String(data[regexMatch.range]).split(separator: ",")
      let firstMul = Int(splitMulOp[0].split(separator: "(")[1]) ?? 0
      let secondMul = Int(splitMulOp[1].split(separator: ")")[0]) ?? 0
      return firstMul * secondMul
    }
  	return partialResults.reduce(0,+)
  }
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    return 0
  }
}
