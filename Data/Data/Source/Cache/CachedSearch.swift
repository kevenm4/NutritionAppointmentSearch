import Foundation
import Domain
import SwiftData

@Model
public final class CachedSearch {
    @Attribute(.unique) public var id: String
    public var professionals: [CachedProfessional]
    public var lastUpdated: Date
    
    public init(id: String, professionals: [CachedProfessional], lastUpdated: Date) {
        self.id = id
        self.professionals = professionals
        self.lastUpdated = lastUpdated
    }
    
    /// Converte um `Search` para `CachedSearch`
    public static func fromSearch(_ search: Search, id: String) -> CachedSearch {
        return CachedSearch(id: id, professionals: search.professionals.map { CachedProfessional.fromProfessional($0) }, lastUpdated: Date())
    }
    
    /// Converte `CachedSearch` de volta para `Search`
    public func toSearch() -> Search {
        return Search(professionals: professionals.map { $0.toProfessional() })
    }
}
