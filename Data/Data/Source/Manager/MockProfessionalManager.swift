import Foundation
import Domain

public class MockProfessionalManager: ProfessionalRepositoryProtocol {

    public init() {}

    public func getProfessional(by id: Int) async throws -> Professional {
        if let professional = Professional.mockProfessionals.first(where: { $0.id == id }) {
            return professional
        }
        throw NSError(domain: "MockProfessionalManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Profissional não encontrado"])
    }

    public func searchProfessionals(limit: Int, offset: Int, sortBy: SortBy, forceReload: Bool = false) async throws -> Search {
        return Search(professionals: sortProfessionals(Professional.mockProfessionals, by: sortBy))
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
