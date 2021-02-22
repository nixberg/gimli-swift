import XCTest
@testable import Gimli

final class GimliTests: XCTestCase {
    func testGimli() {
        var gimli = Gimli()
        
        for i in 0..<4 {
            var j = UInt32(i)
            gimli.s.0[i] = j &* j &* j &+ j &* 0x9e3779b9
            j = UInt32(i + 4)
            gimli.s.1[i] = j &* j &* j &+ j &* 0x9e3779b9
            j = UInt32(i + 8)
            gimli.s.2[i] = j &* j &* j &+ j &* 0x9e3779b9
        }
        
        gimli.permute()
        
        XCTAssertEqual(gimli.s.0, [0xba11c85a, 0x91bad119, 0x380ce880, 0xd24c2c68])
        XCTAssertEqual(gimli.s.1, [0x3eceffea, 0x277a921c, 0x4f73a0bd, 0xda5a9cd8])
        XCTAssertEqual(gimli.s.2, [0x84b673f0, 0x34e52ff7, 0x9e2bef49, 0xf41bb8d6])
    }
    
    func testGimliBytes() {
        var gimli = Gimli()
        
        for _ in 0..<384 {
            gimli.permute()
        }
        
        let expected: [UInt8] = [
            0xf7, 0xb2, 0xd5, 0x86, 0x5e, 0x79, 0x28, 0x27,
            0xcb, 0xad, 0xe4, 0x14, 0x07, 0x5f, 0x6e, 0x3e,
            0x40, 0x8a, 0xcc, 0x2f, 0xdb, 0xb7, 0xbb, 0x56,
            0x47, 0x08, 0x9c, 0xf4, 0xef, 0xc6, 0xc1, 0x23,
            0xf1, 0x21, 0x5b, 0x75, 0x22, 0x2c, 0x72, 0x85,
            0xb8, 0xdb, 0x63, 0x01, 0xe9, 0x0a, 0x73, 0x0c,
        ]
        
        for (i, byte) in expected.enumerated() {
            XCTAssertEqual(gimli[i], byte)
        }
    }
}
