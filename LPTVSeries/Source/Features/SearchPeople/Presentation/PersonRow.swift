//
//
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
import SwiftUI

struct PersonRow: View {
    
    // MARK: Private properties
    private var person: Person
    
    // MARK: Constant properties
    private let gridMiniumHeight: CGFloat = Sizing.scale(35)
    
    init(person: Person) {
        self.person = person
    }
    
    var body: some View {
        ZStack {
            posterView
            backgroundGradient
            personInformationView
        }
        .cornerRadius(8)
        .clipped()
        
    }
    
    // MARK: Poster
    var posterView: some View {
        AsyncImageView(
            url: person.imageUrl ?? "",
            placeholder: .phShow
        )
    }
    
    // MARK: Person Information

    var personInformationView: some View {
        VStack {
            Spacer()
            Text(person.name)
                .foregroundStyle(.white)
                .font(.callout)
                .frame(maxWidth: .infinity)
            if let country = person.country {
                HStack {
                    if let emoji = country.code.flagEmoji {
                        Text(emoji)
                            .font(.headline)
                    }
                    Text(country.name)
                        .foregroundStyle(.white)
                        .font(.caption)
                    Spacer()
                }
            }
        }
        .padding(.bottom, Spacing.s)
        .padding(.horizontal, Spacing.s)
    }
    
    //MARK: Private helpers
    
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.black.opacity(0.1),
                Color.black.opacity(0.7),
                Color.black.opacity(0.9)]),
            startPoint: .center,
            endPoint: .bottom
        )
        .frame(maxWidth: .infinity, alignment: .bottom)
    }
    
}

#Preview {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let items = Array(1...6)

    return ScrollView {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(items, id: \.self) { item in
                PersonRow(
                    person: .init(id: 1,
                                  name: "Pedro Pascal",
                                  infoUrl: nil,
                                  country: .init(
                                    name: "United States",
                                    code: "US"),
                                  imageUrl: "https://static.tvmaze.com/uploads/images/original_untouched/73/184425.jpg",
                                  imageOriginalUrl: "https://static.tvmaze.com/uploads/images/original_untouched/73/184425.jpg",
                                  birthDate: Date(),
                                  gender: "Male",
                                  shows: [])
                )
            }
        }
        .padding()
    }
}

