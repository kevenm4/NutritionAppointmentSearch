import SwiftData
import Foundation
import Domain

@Model
public final class CachedProfessional {
    @Attribute(.unique) public var id: String
    public var name: String
    public var specialty: [String]
    public var languages: [String]
    public var aboutMe: String?
    public var rating: Int
    public var popularity: Int
    public var lastUpdated: Date

    public init(
        id: String,
        name: String,
        specialty: [String],
        languages: [String],
        aboutMe: String?,
        rating: Int,
        popularity: Int,
        lastUpdated: Date
    ) {
        self.id = id
        self.name = name
        self.specialty = specialty
        self.languages = languages
        self.aboutMe = aboutMe
        self.rating = rating
        self.popularity = popularity
        self.lastUpdated = lastUpdated
    }

    static func fromProfessional(_ professional: Professional) -> CachedProfessional {
        return CachedProfessional(
            id: "\(professional.id)", // Garante que é string
            name: professional.name,
            specialty: professional.expertise,
            languages: professional.languages,
            aboutMe: professional.aboutMe,
            rating: professional.rating,
            popularity: professional.ratingCount,
            lastUpdated: Date()
        )
    }

    public func toProfessional() -> Professional {
        return Professional(
            id: Int(id) ?? 0, // Converte de volta para Int
            name: name,
            rating: rating,
            ratingCount: popularity,
            languages: languages,
            expertise: specialty,
            profileImage: String(),
            aboutMe: aboutMe ?? nil
        )
    }
}
