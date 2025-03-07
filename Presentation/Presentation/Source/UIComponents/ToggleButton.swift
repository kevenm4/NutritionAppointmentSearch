import SwiftUI

struct ToggleButton: View {
    @Binding var isExpanded: Bool
    
    var body: some View {
        Button(action: {
            withAnimation { isExpanded.toggle() }
        }) {
            HStack {
                Text(isExpanded ? "show less" : "show more")
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            }
        }
        .padding(.top, 8)
    }
}
