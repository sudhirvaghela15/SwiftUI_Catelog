//
//  SlidersView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

struct SlidersView: View {
	
	@State private var grams1 = 15.0
	@State private var grams2 = 15.0
	@State private var grams3 = 15.0
	@State private var isEditing1 = false
	@State private var isEditing2 = false
	@State private var isEditing3 = false
	
	var body: some View {
		ScrollView {
			HStack() {
				Spacer()
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/slider", name: "SLIDER")
			}
			VStack(alignment: .leading) {
				sliderGrams
				sliderWithVoiceOver
			}
		}.padding(.horizontal, 16)
	}
	
	private var sliderGrams: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text( "Slider with continued values")
					.fontWeight(.heavy)
					.font(.title)
				Text("A slider can be configured with a range of values through which continued numbers can be selected. In this example there is a selection of grams for some tasty receipt.")
					.fontWeight(.light)
					.font(.title2)
			}
			
			Slider(value: $grams1, in: 0...1000) { isEditing in
				isEditing1 = isEditing
			}
			Text("\(grams1)")
				.foregroundColor(isEditing1 ? .blue : .black)
		}
	}
	
	private var sliderWithVoiceOver: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text( "Slider with VoiceOver Label & min / max values")
					.fontWeight(.heavy)
				Text("A slider can also be contained between a minimum and a maximum value. Here a label is also added to the slider, whose text will be spoken in VoiceOver to improve accessibility")
					.fontWeight(.light)
					.font(.title2)
				VStack {
					Slider(value: $grams3, in: 0...1000, onEditingChanged: { isEditing in
						isEditing3 = isEditing
					}, minimumValueLabel: Label(title: {
						Text("50")
					}, icon: {
						Image(systemName: "circle")
					}), maximumValueLabel: Label(title: {
						Text("900")
					}, icon: {
						Image(systemName: "circle")
					}), label: {
						Text("This is a slider for grams")
					})
				}
			}
		}
	}
}
