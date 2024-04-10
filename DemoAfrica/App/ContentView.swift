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
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridActivate: Bool = false
    
//   let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    //: MARK - FUNCTIONS
    func gridSwitch(){
        withAnimation(.easeOut(duration: 0.5)) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            print("Grid Number: \(gridColumn)")
            //TOOLBAR IMAGE
            switch gridColumn{
            case 1:
                toolBarIcon = "square.grid.2x2"
            case 2:
                toolBarIcon = "square.grid.3x2"
            case 3:
                toolBarIcon = "rectangle.grid.1x2"
            default:
                toolBarIcon = "square.grid.2x2"
            }
        }
    }
    
    
    //MARK - BODY
    var body: some View {
        NavigationView{
            Group{
                if !isGridActivate {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                   
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                            
                        }
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10)
                        {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal))
                                {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            } //: LOOP
                        } //: LAZYVGRID
                        .padding(10)
                        .animation(.easeInOut(duration: 0.5), value: gridColumn)
                    } //: SCROLLVIEW
                }//: CONDITION
            }//: GROUP
            
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16){
                        Button(action: {
                            print("List View Is active")
                            isGridActivate = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActivate ? .primary : .accentColor  )
                        })
                        //GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridActivate = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor( isGridActivate ? .accentColor : .primary)
                        })
                    }//: HSTACK
                }//: TOOLBAR ITEM
            }//: TOOLBAR
        }//:NAVIGATION VIEW
    }//:VIEW
}

#Preview {
    ContentView()
}
