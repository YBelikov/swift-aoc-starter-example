//
//  File.swift
//  AdventOfCode
//
//  Created by Yuriy Belikov on 06.12.2024.
//

import Foundation

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
    return zip(entities.map { $0[0] }.sorted(), entities.map { $0[1] }.sorted())
      .reduce(0) { partialResult, pair in
        return partialResult + abs(pair.0 - pair.1)
      }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    var frequencies = [Int](repeating: 0, count: max(entities.map { $0[0] }.max()!, entities.map { $0[1] }.max()!) + 1)
    _ = entities.map { frequencies[$0[1]] += 1 }
    return entities.map { $0[0] * frequencies[$0[0]] }.reduce(0, +)
  }
}
