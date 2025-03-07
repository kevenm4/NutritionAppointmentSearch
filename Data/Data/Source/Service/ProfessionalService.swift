import Foundation
import Core
import Domain

public class ProfessionalService: ProfessionalRepositoryProtocol {

    private let apiClient: APIClient

    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    /// Busca um profissional por ID
    public func getProfessional(by id: Int) async throws -> Domain.Professional {
        return try await apiClient.request(from: "professionals/\(id)")
    }

    /// Busca profissionais com filtros
    public func searchProfessionals(limit: Int, offset: Int, sortBy: SortBy = .bestMatch) async throws -> Search {
        var components = URLComponents(string: "https://nutrisearch.vercel.app/professionals/search")!
        components.queryItems = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "sort_by", value: sortBy.rawValue)
        ]
        
        return try await apiClient.request(with: components)
    }
}

