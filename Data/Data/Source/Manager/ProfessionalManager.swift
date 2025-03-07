import Foundation
import Domain

public class ProfessionalManager: ProfessionalRepositoryProtocol {
    private let service: ProfessionalService
    private let cache: ProfessionalCache
    private let expirationInterval: TimeInterval = 3600 // 1 hora

    public init(service: ProfessionalService) {
        self.service = service
        self.cache = ProfessionalCache()
    }

    public func getProfessional(by id: Int) async throws -> Professional {
        if let cachedProfessional = await cache.getProfessional(by: id, expirationInterval: expirationInterval) {
            return cachedProfessional
        }

        let professional = try await service.getProfessional(by: id)
        await cache.saveProfessional(professional)
        return professional
    }

    public func searchProfessionals(limit: Int, offset: Int, sortBy: SortBy) async throws -> Search {
        if let cachedSearch = await cache.getSearch(limit: limit, offset: offset, expirationInterval: expirationInterval) {
            print("from cache")
            return Search(professionals: sortProfessionals(cachedSearch.professionals, by: sortBy))
        }

        let searchResults = try await service.searchProfessionals(limit: limit, offset: offset, sortBy: .bestMatch)
        print("from service")
        await cache.saveSearch(searchResults, limit: limit, offset: offset)

        return Search(professionals: sortProfessionals(searchResults.professionals, by: sortBy))
    }

    private func sortProfessionals(_ professionals: [Professional], by sortBy: SortBy) -> [Professional] {
        switch sortBy {
        case .bestMatch:
            return professionals
        case .rating:
            return professionals.sorted { $0.rating > $1.rating }
        case .mostPopular:
            return professionals.sorted { $0.ratingCount > $1.ratingCount }
        @unknown default:
            return professionals
        }
    }
}
