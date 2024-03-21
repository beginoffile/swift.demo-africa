//
//  CoverImageView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 20/03/24.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode(file:"covers.json")
    
    // MARK: - BODY
    
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        }//:TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW

#Preview {
    CoverImageView()
       
}
