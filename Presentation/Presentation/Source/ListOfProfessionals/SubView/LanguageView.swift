import SwiftUI

struct LanguageView: View {
    let languages: [String]

    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "globe")
                .font(.caption)
            Text(languages.joined(separator: ", "))
                .font(.caption)
        }
    }
}
