//
//  AboutMeView.swift
//  Presentation
//
//  Created by Keven Esmael on 07/03/2025.
//

import SwiftUI

struct AboutMeView: View {
    var aboutMe: String
    @Binding var isExpanded: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("About me")
                .font(.headline)
            Text(isExpanded ? aboutMe : truncatedText())
                .lineLimit(isExpanded ? nil : 3)
            
            if aboutMe.count > 100 {
                ToggleButton(isExpanded: $isExpanded)
            }
        }
    }
    
    private func truncatedText() -> String {
        guard aboutMe.count > 100 else { return aboutMe }
        let index = aboutMe.index(aboutMe.startIndex, offsetBy: 100)
        return String(aboutMe[..<index]) + "..."
    }
}
