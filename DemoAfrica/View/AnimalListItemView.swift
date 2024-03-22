//
//  AnimalListView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 20/03/24.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    
    
    //MARK - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                RoundedRectangle(cornerRadius: 12)
                )
            
                
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
                
            }
        }
    }
}


#Preview {
    @State var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    
    return AnimalListItemView(animal: animals[0])
}
