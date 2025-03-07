import Foundation

public class APIClient {
    private let baseURL = "https://nutrisearch.vercel.app"
    
    public init() {}
    
    /// Requisição genérica que já retorna o modelo decodificado
    public func request<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func request<T: Decodable>(with components: URLComponents) async throws -> T {
        guard let url = components.url else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}

/// Definição de erros de API para melhor controle
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
