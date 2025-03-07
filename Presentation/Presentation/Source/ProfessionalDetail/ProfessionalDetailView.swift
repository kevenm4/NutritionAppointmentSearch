import SwiftUI
import Domain

public struct ProfessionalDetailView: View {

    @StateObject var viewModel: ProfessionalDetailViewModel
    @Environment(\.dismiss) var dismiss

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HeaderView(professional: viewModel.professional)
            if let aboutMe = viewModel.professional.aboutMe {
                AboutMeView(aboutMe: aboutMe, isExpanded: $viewModel.isExpanded)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.fetchProfessional()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
