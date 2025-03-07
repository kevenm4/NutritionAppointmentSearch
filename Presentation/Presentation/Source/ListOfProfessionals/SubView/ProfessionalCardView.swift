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

struct ProfessionalCardHeaderView: View {
    let professional: Professional

    var body: some View {
        HStack(spacing: 8) {
            UserImageView()
            ProfessionalInfoView(professional: professional)
        }
    }
}

struct UserImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
            switch phase {
            case .empty: ProgressView()
            case .success(let image): imageView(image)
            case .failure: placeholderImage()
            @unknown default: errorImage()
            }
        }
    }

    private func imageView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private func placeholderImage() -> some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 70, height: 70)
            .foregroundColor(.gray)
    }

    private func errorImage() -> some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .foregroundColor(.red)
    }
}

struct ProfessionalInfoView: View {
    let professional: Professional

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(professional.name)
                .font(.headline)
            ProfessionalCardRatingView(rating: professional.rating, count: professional.ratingCount)
            LanguageView(languages: professional.languages)
        }
    }
}

struct ProfessionalCardRatingView: View {
    let rating: Int
    let count: Int

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
            Text("\(rating)/5 (\(count))")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

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

