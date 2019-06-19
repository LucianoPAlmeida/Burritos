import XCTest

import BurritosTests

var tests = [XCTestCaseEntry]()
tests += AtomicWriteTests.allTests()
tests += CopyingTests.allTests()
tests += LateInitTests.allTests()
tests += LazyTests.allTests()
tests += UserDefaultTests.allTests()
XCTMain(tests)
