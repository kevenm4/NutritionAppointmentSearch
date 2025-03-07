import SwiftUI
import Domain

struct HeaderView: View {
    var professional: Professional?
    
    var body: some View {
        HStack {
            UserImageView()
            VStack(alignment: .leading) {
                Text(professional?.name ?? "")
                    .font(.title)
                HStack {
                    RatingView(rating: professional?.rating ?? 0)
                    Text("\(professional?.rating ?? 0)/5 (\(professional?.ratingCount ?? 0))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}
