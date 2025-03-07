import Foundation
import Domain
internal import FirebaseFirestore

public actor ProfessionalCache {
    private let db = Firestore.firestore()
    private let collectionName = "cached_professionals"
    private let searchCollectionName = "cached_searches"

    public init() {}

    /// Busca um profissional no cache com verificação de expiração
    public func getProfessional(by id: Int, expirationInterval: TimeInterval) async -> Professional? {
        let documentRef = db.collection(collectionName).document("\(id)")

        do {
            let snapshot = try await documentRef.getDocument()
            guard let data = snapshot.data() else { return nil }

            let lastUpdated = (data["lastUpdated"] as? Timestamp)?.dateValue() ?? Date.distantPast
            if Date().timeIntervalSince(lastUpdated) > expirationInterval {
                return nil // Cache expirado
            }

            return Professional(
                id: id,
                name: data["name"] as? String ?? "",
                rating: data["rating"] as? Int ?? 0,
                ratingCount: data["popularity"] as? Int ?? 0,
                languages: data["languages"] as? [String] ?? [],
                expertise: data["specialty"] as? [String] ?? [],
                profileImage: "",
                aboutMe: data["aboutMe"] as? String ?? ""
            )
        } catch {
            print("Erro ao obter profissional do Firestore: \(error)")
            return nil
        }
    }

    /// Salva um profissional no Firestore
    public func saveProfessional(_ professional: Professional) async {
        let documentRef = db.collection(collectionName).document("\(professional.id)")

        let data: [String: Any] = [
            "name": professional.name,
            "specialty": professional.expertise,
            "languages": professional.languages,
            "aboutMe": professional.aboutMe ?? "",
            "rating": professional.rating,
            "popularity": professional.ratingCount,
            "lastUpdated": Timestamp(date: Date())
        ]

        do {
            try await documentRef.setData(data)
        } catch {
            print("Erro ao salvar profissional no Firestore: \(error)")
        }
    }

    /// Busca uma pesquisa de profissionais no cache com verificação de expiração
    public func getSearch(limit: Int, offset: Int, expirationInterval: TimeInterval) async -> Search? {
        let id = "\(limit)-\(offset)"
        let documentRef = db.collection(searchCollectionName).document(id)

        do {
            let snapshot = try await documentRef.getDocument()
            guard let data = snapshot.data() else { return nil }

            let lastUpdated = (data["lastUpdated"] as? Timestamp)?.dateValue() ?? Date.distantPast
            if Date().timeIntervalSince(lastUpdated) > expirationInterval {
                return nil
            }

            let professionalsData = data["professionals"] as? [[String: Any]] ?? []
            let professionals = professionalsData.compactMap { dict -> Professional? in
                guard let id = dict["id"] as? Int else { return nil }
                return Professional(
                    id: id,
                    name: dict["name"] as? String ?? "",
                    rating: dict["rating"] as? Int ?? 0,
                    ratingCount: dict["popularity"] as? Int ?? 0,
                    languages: dict["languages"] as? [String] ?? [],
                    expertise: dict["specialty"] as? [String] ?? [],
                    profileImage: "",
                    aboutMe: dict["aboutMe"] as? String ?? ""
                )
            }

            return Search(professionals: professionals)
        } catch {
            print("Erro ao obter pesquisa do Firestore: \(error)")
            return nil
        }
    }

    /// Salva uma pesquisa no Firestore
    public func saveSearch(_ search: Search, limit: Int, offset: Int) async {
        let id = "\(limit)-\(offset)"
        let documentRef = db.collection(searchCollectionName).document(id)

        let professionalsData = search.professionals.map { professional in
            return [
                "id": professional.id,
                "name": professional.name,
                "specialty": professional.expertise,
                "languages": professional.languages,
                "aboutMe": professional.aboutMe ?? "",
                "rating": professional.rating,
                "popularity": professional.ratingCount
            ] as [String: Any]
        }

        let data: [String: Any] = [
            "professionals": professionalsData,
            "lastUpdated": Timestamp(date: Date())
        ]

        do {
            try await documentRef.setData(data)
        } catch {
            print("Erro ao salvar pesquisa no Firestore: \(error)")
        }
    }
}
