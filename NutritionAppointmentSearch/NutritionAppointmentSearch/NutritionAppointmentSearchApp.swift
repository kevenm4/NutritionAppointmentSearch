import SwiftUI
import FirebaseFirestore
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

        // Injeção de dependência: agora passamos o Firestore
        let firestore = Firestore.firestore()
        self.professionalCache = ProfessionalCache()

        self.professionalRepository = ProfessionalManager(service: professionalService)
    }
}
