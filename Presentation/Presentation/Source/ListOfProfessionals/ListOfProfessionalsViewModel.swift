import Foundation
import DataLayer
import Domain

@MainActor
class ListOfProfessionalsViewModel: ObservableObject {

    @Published var listOfProfessionals: [Professional] = []

    var repository: ProfessionalRepositoryProtocol

    init(repository: ProfessionalRepositoryProtocol) {
        self.repository = repository
    }

    func fetchListOfProfessionals(sortBy: SortBy, forceReload: Bool) {
        Task {
            do {
                let searchResult = try await repository.searchProfessionals(limit: 8, offset: 0, sortBy: sortBy, forceReload: forceReload)
                listOfProfessionals = searchResult.professionals
            } catch {
                print("Erro ao buscar profissionais: \(error)")
            }
        }
    }
}
