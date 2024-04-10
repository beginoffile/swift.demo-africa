//
//  AnimalGridItemView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 08/04/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    @State var animals: [Animal] = Bundle.main.decode(file: "animals.json")
    return AnimalGridItemView(animal: animals[0])
}
