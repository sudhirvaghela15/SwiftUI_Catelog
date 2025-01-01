//
//  ListSectionFontModifier.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

struct ListSectionFontModifier: ViewModifier {
	
	private var font = Font.system(.title).weight(.black)
	
	func body(content: Content) -> some View {
		content
			.font(font)
			.tint(.white)
			.padding(.top, 16)
			.padding(.bottom, 16)
	}
}
