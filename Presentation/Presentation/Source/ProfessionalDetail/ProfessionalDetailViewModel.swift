import Foundation
import DataLayer
import Domain

@MainActor
class ProfessionalDetailViewModel: ObservableObject {
    @Published var professional: Professional
    @Published var isExpanded = false
    
    private let repository: ProfessionalRepositoryProtocol

    init(repository: ProfessionalRepositoryProtocol, professional: Professional) {
        self.repository = repository
        self.professional = professional
    }

    func fetchProfessional() {
        Task {
            do {
                let fetchedProfessional = try await repository.getProfessional(by: professional.id)
                professional = fetchedProfessional
            } catch {
                print("Erro ao buscar profissional: \(error)")
            }
        }
    }
}

