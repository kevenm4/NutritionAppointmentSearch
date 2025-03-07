import Foundation
import DataLayer
import Domain

@MainActor
class ListOfProfessionalsViewModel: ObservableObject {

    @Published var listOfProfessionals: [Professional] = []
    @Published var selectedOption: SortBy = .bestMatch

    var sortOptions: [SortBy] = [.bestMatch, .rating, .mostPopular]
    var repository: ProfessionalRepositoryProtocol
    var limit = 10

    init(repository: ProfessionalRepositoryProtocol) {
        self.repository = repository
    }

    func fetchListOfProfessionals(sortBy: SortBy, forceReload: Bool) {
        Task {
            do {
                let searchResult = try await repository.searchProfessionals(limit: limit, offset: 0, sortBy: sortBy, forceReload: forceReload)
                listOfProfessionals = searchResult.professionals
            } catch {
                print("Erro ao buscar profissionais: \(error)")
            }
        }
    }
}
