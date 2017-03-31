import UIKit
import XCTest
@testable import ASProgressHud

class Tests: XCTestCase {
    
    func testHudPropertyInitializer() {
        
        var property = HudProperty(prefixName: "_prefix", frameNumber: 30)
        
        XCTAssertEqual(property.frameNumber, 30)
        XCTAssertEqual(property.prefixName, "_prefix")
        
        property = HudProperty(prefixName: "image_", frameNumber: 40, size: 10.0, animationDuration: 1.0, backgroundColor: UIColor.red)
        
        XCTAssertEqual(property.frameNumber, 40)
        XCTAssertEqual(property.prefixName, "image_")
        XCTAssertEqual(property.size, 10.0)
        XCTAssertEqual(property.backgroundColor, UIColor.red)
    }
    
    func testHudType() {
        
        var type = HudType.default
        XCTAssertEqual(type.properties.prefixName, "default")
        XCTAssertEqual(type.properties.frameNumber, 18)
        
        type = HudType.flag
        XCTAssertEqual(type.properties.prefixName, "flag")
        XCTAssertEqual(type.properties.frameNumber, 20)
        
        type = HudType.google
        XCTAssertEqual(type.properties.prefixName, "google")
        XCTAssertEqual(type.properties.frameNumber, 30)
    }
    
    func testProgressHudInitializer() {
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let property = HudProperty(prefixName: "google", frameNumber: 30)
        
        var hud = ASProgressHud(frame: frame, type: HudType.default)
        XCTAssertEqual(hud.frame, frame)
        
        hud = ASProgressHud(frame: frame, hudProperty: property)
        XCTAssertEqual(hud.frame, frame)
    }
}
