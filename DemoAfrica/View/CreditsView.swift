//
//  CreditsView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 09/04/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    CopyRight © Cesar Paez
    All right reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
        
    }
}

#Preview {
    CreditsView()
}
