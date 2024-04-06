//
//  MapAnnotationView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 06/04/24.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // MARK: - PROPERTIES
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill()
                .frame(width: 34, height: 35, alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 32, height: 32, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32, alignment: .center)
            .clipShape(Circle())
        } //: STACK
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

#Preview {
    var locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")

    return MapAnnotationView(location: locations[0])
}
