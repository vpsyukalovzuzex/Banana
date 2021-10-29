//
// String+Common.swift
//

import Foundation

extension String {
    
    func stripHtml() -> String {
        guard let data = data(using: .utf8) else {
            return ""
        }
        let attributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html
            ],
            documentAttributes: nil
        )
        return attributedString?.string ?? ""
    }
    
    func count(for word: String) -> Int {
        var result = 0
        var index = startIndex
        while index < endIndex, let range = range(of: word, options: [.caseInsensitive], range: index..<endIndex), !range.isEmpty {
            result += 1
            index = range.upperBound
        }
        return result
    }
}
