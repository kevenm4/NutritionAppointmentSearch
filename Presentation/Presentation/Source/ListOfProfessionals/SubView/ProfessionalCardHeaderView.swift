import SwiftUI
import Domain

struct ProfessionalCardHeaderView: View {
    let professional: Professional

    var body: some View {
        HStack(spacing: 8) {
            UserImageView()
            ProfessionalInfoView(professional: professional)
        }
    }
}
