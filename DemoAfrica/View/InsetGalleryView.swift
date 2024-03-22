//
//  InsetGalleryView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 21/03/24.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self){ item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//:HSTACK
            }
        }
    }
}

#Preview {
    @State var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    return InsetGalleryView(animal: animals[0])
}
