import Foundation

func cleanHTMLDescription(_ html: String) -> [String] {
    var cleanedItems: [String] = []
    do {
        let regex = try NSRegularExpression(pattern: "<li>(.*?)</li>", options: .caseInsensitive)
        let matches = regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.utf16.count))
        
        for match in matches {
            if let range = Range(match.range(at: 1), in: html) {
                let item = String(html[range]).trimmingCharacters(in: .whitespacesAndNewlines)
                cleanedItems.append(item)
            }
        }
    } catch {
        print("Error parsing HTML: \(error)")
    }
    return cleanedItems
}
