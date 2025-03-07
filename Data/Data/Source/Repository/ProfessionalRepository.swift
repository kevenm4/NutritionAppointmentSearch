import Foundation
import Domain

public protocol ProfessionalRepositoryProtocol {
    func getProfessional(by id: Int) async throws -> Professional
    func searchProfessionals(limit: Int, offset: Int, sortBy: SortBy) async throws -> Search
}
