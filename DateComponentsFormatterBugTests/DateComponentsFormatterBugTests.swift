//
//  DateComponentsFormatterBugTests.swift
//  DateComponentsFormatterBugTests
//
//  Created by Robert Ryan on 7/26/22.
//

import XCTest

class DateComponentsFormatterBugTests: XCTestCase {

    func testNumberFormatter() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.formattingContext = .beginningOfSentence
        let string = formatter.string(for: 5)                 // "Five"; good
        XCTAssertEqual(string, "Five")
    }

    func testDateComponentsFormatter() {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .spellOut
        formatter.formattingContext = .beginningOfSentence
        let string = formatter.string(from: 5 * 60)           // "five minutes"; bad, should be "Five minutes"
        XCTAssertEqual(string, "Five minutes")
    }

}
