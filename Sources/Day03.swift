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
    processString(data)
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let allowCalcCommand = "do()"
    let disallowCalcCommand = "don't()"
    var windowWidth = disallowCalcCommand.count
    var windowStartIndex = data.startIndex
    var windowEndIndex = data.index(windowStartIndex, offsetBy: disallowCalcCommand.count - 1, limitedBy: data.endIndex) ?? data.endIndex
    var lastUsedIndex = data.startIndex
    var searchingForDont = true
    var sum = 0
    while windowEndIndex < data.endIndex {
      if searchingForDont {
        if String(data[windowStartIndex...windowEndIndex]) == disallowCalcCommand {
          searchingForDont = false
          sum += processString(String(data[lastUsedIndex...windowStartIndex]))
          windowWidth = allowCalcCommand.count
          windowEndIndex = data.indexShifted(from: windowStartIndex, offsetBy: windowWidth - 1)
        }
      } else {
        if String(data[windowStartIndex...windowEndIndex]) == allowCalcCommand {
          searchingForDont = true
          lastUsedIndex =  data.indexShifted(from: windowEndIndex, offsetBy: 1)
          windowWidth = disallowCalcCommand.count
          windowEndIndex = data.indexShifted(from: windowStartIndex, offsetBy: windowWidth - 1)
        }
      }
      windowStartIndex = data.index(after: windowStartIndex)
      windowEndIndex = data.index(after: windowEndIndex)
    }
    if searchingForDont {
      sum += processString(String(data[lastUsedIndex...]))
    }
    return sum
  }
  
  func processString(_ str: String) -> Int {
    guard let mulOpRegex = try? Regex("mul\\(\\d+,\\d+\\)") else {
      return -1
    }
    let matches = str.matches(of: mulOpRegex)
    let partialResults = matches.map { regexMatch in
      let splitMulOp = String(str[regexMatch.range]).split(separator: ",")
      let firstMul = Int(splitMulOp[0].split(separator: "(")[1]) ?? 0
      let secondMul = Int(splitMulOp[1].split(separator: ")")[0]) ?? 0
      return firstMul * secondMul
    }
    return partialResults.reduce(0,+)
  }
}

extension String {
  func indexShifted(from index: String.Index, offsetBy distance: Int) -> String.Index {
    return self.index(index, offsetBy: distance, limitedBy: self.endIndex) ?? endIndex
  }
}

