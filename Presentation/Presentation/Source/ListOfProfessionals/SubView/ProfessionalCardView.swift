import SwiftUI
import Domain

struct ProfessionalCardView: View {

    var professional: Professional

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ProfessionalCardHeaderView(professional: professional)
            ExpertiseView(expertise: professional.expertise)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
    }
}

struct ProfessionalInfoView: View {
    let professional: Professional

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(professional.name)
                .font(.headline)
            HStack(spacing: 2) {
                RatingView(rating: professional.rating)
                Text("\(professional.rating)/5 (\(professional.ratingCount))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            LanguageView(languages: professional.languages)
        }
    }
}

#Preview {
    ProfessionalCardView(professional: .init(
        id: 1,
        name: "keven",
        rating: 3,
        ratingCount: 43,
        languages: ["portugues", "english"],
        expertise: ["informative", "muscle gain"],
        profileImage: "",
        aboutMe: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. anim id est laborum asldfjsdal."
    ))
}

