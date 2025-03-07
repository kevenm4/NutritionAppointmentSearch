import SwiftUI
import SwiftData
import Presentation
import DataLayer
import Core

@main
struct NutritionAppointmentSearchApp: App {
    private let container = AppContainer.shared

    var body: some Scene {
        WindowGroup {
            ListOfProfessionalsView(repository: container.professionalRepository)
        }
    }
}

@MainActor
final class AppContainer {
    static let shared = AppContainer()

    let apiClient: APIClient
    let professionalService: ProfessionalService
    let professionalCache: ProfessionalCache
    let professionalRepository: ProfessionalManager

    private init() {
        self.apiClient = APIClient()
        self.professionalService = ProfessionalService(apiClient: apiClient)

        // Inicializa SwiftData corretamente no MainActor
        let modelContainer = try! ModelContainer(for: CachedProfessional.self, CachedSearch.self)

        self.professionalCache = ProfessionalCache(modelContainer: modelContainer) // ← Agora passamos `modelContainer`
        self.professionalRepository = ProfessionalManager(service: professionalService, cache: professionalCache)
    }
}
