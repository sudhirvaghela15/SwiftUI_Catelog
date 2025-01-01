//
//  ButtonFontModifier.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

struct ButtonFontModifier: ViewModifier {
    
    var font = Font.system(.title).weight(.bold)
    
    func body(content: Content) -> some View {
        content
            .font(font)
			.foregroundColor(Color.black)
            .padding()
        
    }
}

