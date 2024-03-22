//
//  ContentView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    //MARK - PROPERTIES
    
    let animals : [Animal] = Bundle.main.decode(file: "animals.json")
    
    //MARK - BODY
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
           
                ForEach(animals){ animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    }
                    
                }
            }//:LIST
            .navigationBarTitle("Africa", displayMode: .large)
        }//:NAVIGATION VIEW
    }//:VIEW
}

#Preview {
    ContentView()
}
