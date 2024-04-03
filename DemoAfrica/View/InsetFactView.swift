//
//  InsetFactView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 22/03/24.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        Group {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            .background(Color.accentColor) // Este color se lo tuve que poner yo
        }//: GROUP
    }
}

#Preview {
    @State var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    return InsetFactView(animal: animals[0])
}
