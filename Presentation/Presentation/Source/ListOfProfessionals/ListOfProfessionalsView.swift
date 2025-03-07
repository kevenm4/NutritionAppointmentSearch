import SwiftUI
import DataLayer
import Domain

public struct ListOfProfessionalsView: View {

    @StateObject private var viewModel: ListOfProfessionalsViewModel

    public init(repository: ProfessionalRepositoryProtocol) {
        _viewModel = StateObject(wrappedValue: ListOfProfessionalsViewModel(repository: repository))
    }

    public var body: some View {
        NavigationView {
            ScrollView {
                DropdownPicker(
                    title: "Sort by",
                    options: viewModel.sortOptions,
                    selection: $viewModel.selectedOption
                )
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .onChange(of: viewModel.selectedOption) {
                    viewModel.fetchListOfProfessionals(sortBy: viewModel.selectedOption, forceReload: false)
                }

                VStack(spacing: 16) {
                    ForEach(viewModel.listOfProfessionals, id: \.id) { professional in
                        NavigationLink(
                            destination: ProfessionalDetailView(viewModel: ProfessionalDetailViewModel(repository: viewModel.repository, professional: professional))
                        ) {
                            ProfessionalCardView(professional: professional)
                                .foregroundStyle(.black)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
            }
            .scrollIndicators(.hidden)
        }
        .onAppear {
            viewModel.fetchListOfProfessionals(sortBy: viewModel.selectedOption, forceReload: false)
        }
        .refreshable {
            viewModel.fetchListOfProfessionals(sortBy: viewModel.selectedOption, forceReload: true)
        }
    }
}
