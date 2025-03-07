import Foundation

extension Array where Element == String {
    public func toJSON() -> String {
        guard let data = try? JSONEncoder().encode(self),
              let jsonString = String(data: data, encoding: .utf8) else {
            return "[]" // Retorna um array vazio em formato JSON se falhar
        }
        return jsonString
    }
}

extension String {
    public func toArray() -> [String]? {
        guard let data = self.data(using: .utf8),
              let array = try? JSONDecoder().decode([String].self, from: data) else {
            return nil
        }
        return array
    }
}
