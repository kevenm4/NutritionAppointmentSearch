import Foundation

public struct Professional: Decodable {
    public var id: Int
    public var name: String
    public var rating: Int
    public var ratingCount: Int
    public var languages: [String]
    public var expertise: [String]
    public var profileImage: String
    public var aboutMe: String?  // Agora opcional

    public init(
        id: Int,
        name: String,
        rating: Int,
        ratingCount: Int,
        languages: [String],
        expertise: [String],
        profileImage: String,
        aboutMe: String?
    ) {
        self.id = id
        self.name = name
        self.rating = rating
        self.ratingCount = ratingCount
        self.languages = languages
        self.expertise = expertise
        self.profileImage = profileImage
        self.aboutMe = aboutMe
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case ratingCount = "rating_count"
        case languages
        case expertise
        case profileImage = "profile_picture_url"
        case aboutMe = "about_me"
    }
}
