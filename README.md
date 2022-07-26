#  DateComponentsFormatter formattingContext Bug

See `DateComponentsFormatterBugTests`. Press <kbd>command</kbd>-<kbd>u</kbd> or choose “Product” » “Test”.

The following succeeds:

```swift
func testNumberFormatter() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    formatter.formattingContext = .beginningOfSentence
    let string = formatter.string(for: 5)                 // "Five"; good
    XCTAssertEqual(string, "Five")
}
```

The following fails:

```swift
func testDateComponentsFormatter() {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .spellOut
    formatter.formattingContext = .beginningOfSentence
    let string = formatter.string(from: 5 * 60)           // "five minutes"; bad, should be "Five minutes"
    XCTAssertEqual(string, "Five minutes")
}
```
