import SwiftUI

struct ExpertiseView: View {
    let expertise: [String]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(expertise, id: \..self) { item in
                Text(item)
                    .font(.caption)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
    }
}
