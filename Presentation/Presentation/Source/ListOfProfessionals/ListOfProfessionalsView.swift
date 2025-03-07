import SwiftUI
import DataLayer
import Domain

public struct ListOfProfessionalsView: View {

    @State private var selectedOption: SortBy = .bestMatch
    @StateObject private var viewModel: ListOfProfessionalsViewModel

    let sortOptions: [SortBy] = [.bestMatch, .rating, .mostPopular]

    public init(repository: ProfessionalRepositoryProtocol) {
        _viewModel = StateObject(wrappedValue: ListOfProfessionalsViewModel(repository: repository))
    }

    public var body: some View {
        NavigationView {
            ScrollView {
                DropdownPicker(
                    title: "Sort by",
                    options: sortOptions,
                    selection: $selectedOption
                )
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .onChange(of: selectedOption) {
                    viewModel.fetchListOfProfessionals(sortBy: selectedOption, forceReload: false)
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
            viewModel.fetchListOfProfessionals(sortBy: selectedOption, forceReload: false)
        }
        .refreshable {
            viewModel.fetchListOfProfessionals(sortBy: selectedOption, forceReload: true)
        }
    }
}
