//
//  ExternalWebslinkView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 02/04/24.
//

import SwiftUI

struct ExternalWebslinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        GroupBox{
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }//: STACK
        }//: BOX
    }
}

#Preview {
    @State var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    return ExternalWebslinkView(animal: animals[0])
}
