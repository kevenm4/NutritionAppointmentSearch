//
//  ProfessionalDetailView.swift
//  Presentation
//
//  Created by Keven Esmael on 04/03/2025.
//

import SwiftUI
import Domain

public struct ProfessionalDetailView: View {

    @StateObject var viewModel: ProfessionalDetailViewModel
    @State private var isExpanded = false
    @Environment(\.dismiss) var dismiss

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HeaderView(professional: viewModel.professional)
            AboutMeView(aboutMe: viewModel.professional.aboutMe ?? "", isExpanded: $isExpanded)
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

struct HeaderView: View {
    var professional: Professional?
    
    var body: some View {
        HStack {
            UserImageView()
            VStack(alignment: .leading) {
                Text(professional?.name ?? "")
                    .font(.title)
                HStack {
                    RatingView(rating: professional?.rating ?? 0)
                    Text("\(professional?.rating ?? 0)/5 (\(professional?.ratingCount ?? 0))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}

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
