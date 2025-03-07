import Foundation
import Domain
import SwiftData

public actor ProfessionalCache {
    private let modelContainer: ModelContainer

    public init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    /// Busca um profissional no cache com verificação de expiração
    @MainActor
    func getProfessional(by id: Int, expirationInterval: TimeInterval) -> Professional? {
        let modelContext = modelContainer.mainContext
        let fetchDescriptor = FetchDescriptor<CachedProfessional>(predicate: #Predicate { $0.id == id })
        guard let cachedProfessional = try? modelContext.fetch(fetchDescriptor).first else { return nil }

        if Date().timeIntervalSince(cachedProfessional.lastUpdated) > expirationInterval {
            return nil
        }
        return cachedProfessional.toProfessional()
    }

    /// Busca uma pesquisa de profissionais no cache com verificação de expiração
    @MainActor
    func getSearch(limit: Int, offset: Int, expirationInterval: TimeInterval) -> Search? {
        let id = "\(limit)-\(offset)"
        let modelContext = modelContainer.mainContext
        let fetchDescriptor = FetchDescriptor<CachedSearch>(predicate: #Predicate { $0.id == id })
        guard let cachedSearch = try? modelContext.fetch(fetchDescriptor).first else { return nil }

        if Date().timeIntervalSince(cachedSearch.lastUpdated) > expirationInterval {
            return nil
        }

        return cachedSearch.toSearch()
    }

    /// Salva um profissional no cache
    @MainActor
    func saveProfessional(_ professional: Professional) {
        let modelContext = modelContainer.mainContext
        let cachedProfessional = CachedProfessional.fromProfessional(professional)
        modelContext.insert(cachedProfessional)

        do {
            try modelContext.save()
        } catch {
            print("Erro ao salvar profissional no cache: \(error)")
        }
    }

    /// Salva uma pesquisa no cache (substitui a anterior, se existir)
    @MainActor
    func saveSearch(_ search: Search, limit: Int, offset: Int) {
        let id = "\(limit)-\(offset)"
        let modelContext = modelContainer.mainContext
        
        // Remove a pesquisa antiga antes de salvar a nova
        let fetchDescriptor = FetchDescriptor<CachedSearch>(predicate: #Predicate { $0.id == id })
        if let existingSearch = try? modelContext.fetch(fetchDescriptor).first {
            modelContext.delete(existingSearch)
        }

        let cachedSearch = CachedSearch.fromSearch(search, id: id)
        modelContext.insert(cachedSearch)

        do {
            try modelContext.save()
        } catch {
            print("Erro ao salvar pesquisa no cache: \(error)")
        }
    }
}
