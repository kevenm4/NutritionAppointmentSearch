//
//  RatingView.swift
//  Presentation
//
//  Created by Keven Esmael on 07/03/2025.
//

import SwiftUI

struct RatingView: View {
    let rating: Int

    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
        }
    }
}
