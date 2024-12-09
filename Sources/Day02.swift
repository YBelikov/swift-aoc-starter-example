//
//  File.swift
//  AdventOfCode
//
//  Created by Yuriy Belikov on 07.12.2024.
//

import Foundation

struct Day02: AdventDay {
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
    return entities.reduce(into: 0) { partialResult, sequence in
      if isSorted(sequence) {
        partialResult += 1
      }
    }
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    return entities.reduce(into: 0) { partialResult, sequence in
      if isCorrectable(sequence) {
        partialResult += 1
      }
    }
  }
  
  func isSorted(_ array: [Int]) -> Bool {
    guard let first = array.first, let last = array.last else {
      return false
    }
    let isAscending = last - first > 0
    return zip(array, array.dropFirst()).allSatisfy({ (isAscending ? $0.1 > $0.0 : $0.1 < $0.0) &&
                                                      (1...3).contains(abs($0.0 - $0.1))})
  }
  
  func isCorrectable(_ array: [Int]) -> Bool {
    if isSorted(array) {
      return true
    }
    for i in array.indices {
      var tmpArray = array
      _ = tmpArray.remove(at: i)
      if isSorted(tmpArray)
      {
        return true
      }
    }
    return false
  }
}
