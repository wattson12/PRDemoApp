import Danger
import Foundation

let danger = Danger()

let fileManager = FileManager.default
if fileManager.fileExists(atPath: ".swiftlint.results.json") {
    if let results = try? String(contentsOfFile: ".swiftlint.results.json", encoding: String.Encoding.utf8) {
        if(results.contains("fail")) {
            fail("```json\n" + results + "\n```")
        } else {
            warn("```json\n" + results + "\n```")
        }
    }
}
