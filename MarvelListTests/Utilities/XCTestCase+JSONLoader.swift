import Foundation
import XCTest

extension XCTestCase {
    func getDataFromJson(with filename: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: filename, ofType: "json") else {
            fatalError("Could not get file path")
        }
        
        let url = URL(fileURLWithPath: path)
        return try! Data(contentsOf: url)
    }
}
