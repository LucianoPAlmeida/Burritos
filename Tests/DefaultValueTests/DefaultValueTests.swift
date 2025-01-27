//
//  DefaultValueTests.swift
//  Burritos
//
//  Created by Evgeniy (@own2pwn) on 28/06/2019.
//

@testable import DefaultValue
import XCTest

final class DefaultValueTests: XCTestCase {
    
    // MARK: - Members
    
    private static let defaultValue = 4.0
    
    // MARK: - Members
    
    @DefaultValue(default: DefaultValueTests.defaultValue)
    var double
    
    @DefaultValue(default: "Hello, World!")
    var optional: String?
    
    // MARK: - Tests
    
    override func setUp() {
        $double = DefaultValue(default: DefaultValueTests.defaultValue)
        $optional = DefaultValue(default: "Hello, World!")
    }
    
    func testGetDefaultValue() {
        XCTAssertEqual(double, DefaultValueTests.defaultValue)
    }

    func testGetNonDefaultValue() {
        $double = DefaultValue(default: DefaultValueTests.defaultValue, initial: 5)
        XCTAssertEqual(double, 5)
    }

    func testSet() {
        double = 6
        XCTAssertEqual(double, 6)
    }

    func testResetBySettingNil() {
        $double = DefaultValue(default: DefaultValueTests.defaultValue, initial: 5)
        double = nil
        XCTAssertEqual(double, DefaultValueTests.defaultValue)
    }
    
    func testReset() {
        $double = DefaultValue(default: DefaultValueTests.defaultValue, initial: 5)
        $double.reset()
        XCTAssertEqual(double, DefaultValueTests.defaultValue)
    }
    
    func testOptionalReset() {
        $optional = DefaultValue(default: "Hello, World!")
        optional = "Yay"
        optional = nil
        XCTAssertEqual(optional, "Hello, World!")
    }
    
    // MARK: - Helpers

    static var allTests = [
        ("testGetDefaultValue", testGetDefaultValue),
        ("testGetNonDefaultValue", testGetNonDefaultValue),
        ("testSet", testSet),
        ("testResetBySettingNil", testResetBySettingNil),
        ("testReset", testReset),
        ("testOptionalReset", testOptionalReset),
    ]
}
