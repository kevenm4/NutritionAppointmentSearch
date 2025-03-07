import Foundation

public enum SortBy: String {
    case bestMatch = "best_match"
    case rating = "rating"
    case mostPopular = "most_popular"
}

extension SortBy: Identifiable, CustomStringConvertible {
    public var id: String { rawValue }
    public var description: String {
        switch self {
        case .bestMatch: return "Best Match"
        case .rating: return "Rating"
        case .mostPopular: return "Most Popular"
        }
    }
}
