//
//  File.swift
//  AdventOfCode
//
//  Created by Yuriy Belikov on 07.01.2025.
//

import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day03Tests {
  // Smoke test data provided in the challenge question
  let testData1 = """
      xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
    """
  
  let testData2_1 = """
                  xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
                  """
  
  let testData2_2 = """
                  xmul(2,4)&mul[3,7]!
                  """
  
  let testData2_3 = """
                  xmul(2,4)&mul[3,7]don't()_mul(4,6)don't()?mul(4,3)!?do()mul(11,2)!
                  """
  
  let testData2_4 = """
                  xmul(2,4)&mul[3,7]do()mul(4,6)don't()?mul(4,3)!?do()mul(11,2)!
                  """
  
  let testData2_5 = """
                  xmul(2,4)&mul[3,7]do()mul(4,6)don't()?mul(4,3)!?do()mul(11,2)!
                  """
  
  @Test func testPart1() async throws {
    let challenge = Day03(data: testData1)
    #expect(String(describing: challenge.part1()) == "161")
  }

  @Test func testPart2_1() async throws {
    let challenge = Day03(data: testData2_1)
    #expect(String(describing: challenge.part2()) == "48")
  }
  
  @Test func testPart2_2() async throws {
    let challenge = Day03(data: testData2_2)
    #expect(String(describing: challenge.part2()) == "8")
  }
  
  @Test func testPart2_3() async throws {
    let challenge = Day03(data: testData2_3)
    #expect(String(describing: challenge.part2()) == "30")
  }
  
  @Test func testPart2_4() async throws {
    let challenge = Day03(data: testData2_4)
    #expect(String(describing: challenge.part2()) == "54")
  }
}
