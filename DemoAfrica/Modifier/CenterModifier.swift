//
//  CenterModifier.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 09/04/24.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) ->some View{
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
