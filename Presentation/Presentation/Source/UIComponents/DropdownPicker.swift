import SwiftUI

struct DropdownPicker<T: Hashable & Identifiable & CustomStringConvertible>: View {
    let title: String
    let options: [T]
    @Binding var selection: T
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                isExpanded.toggle()
            }) {
                HStack {
                    Text(selection.description)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundStyle(Color.black)
                }
                .padding(.horizontal)
                .frame(height: 44)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(options) { option in
                        Button(action: {
                            selection = option
                            isExpanded.toggle()
                        }) {
                            Text(option.description)
                                .foregroundStyle(Color.black)
                                .padding(.horizontal)
                                .frame(height: 44)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemBackground))
                        }
                        Divider()
                    }
                }
                .background(Color(.systemBackground))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.separator), lineWidth: 1)
        )
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
