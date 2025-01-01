//
//  RoundedBordersModifier.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUICore

struct RoundedBordersModifier: ViewModifier {
	var radius: CGFloat
	var lineWidth: CGFloat
	var color: Color = Color.accentColor
	
	func body(content: Content) -> some View {
		content.cornerRadius(radius)
			.overlay(RoundedRectangle(cornerRadius: radius).stroke(color, lineWidth: lineWidth))
	}
}
