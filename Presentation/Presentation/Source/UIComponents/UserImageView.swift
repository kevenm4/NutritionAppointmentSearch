//
//  UserImageView.swift
//  Presentation
//
//  Created by Keven Esmael on 07/03/2025.
//

import SwiftUI

struct UserImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
            switch phase {
            case .empty: ProgressView()
            case .success(let image): imageView(image)
            case .failure: placeholderImage()
            @unknown default: errorImage()
            }
        }
    }

    private func imageView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private func placeholderImage() -> some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 70, height: 70)
            .foregroundColor(.gray)
    }

    private func errorImage() -> some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .foregroundColor(.red)
    }
}
