//
//  ButtonView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/button

struct ButtonsView: View {
	private let namespace: Namespace.ID
	
	@State private var color: Color = .clear
	@State private var color2: Color = .clear
	
	@State private var colorBorder: Color = .accentColor
	@State private var colorBorder2: Color = .accentColor
	
	@State private var borderWidth: Double = 1
	@State private var borderWidth2: Double = 1
	
	@State private var font: UIFont = UIFont.preferredFont(forTextStyle: .body)
	@State private var radius2: CGFloat = 10.0
	
	@State private var buttonWidth: CGFloat = 100
	@State private var buttonHeight: CGFloat = 44
	
	@State private var textStyle2: UIFont.TextStyle = .body
	
	
	init(namespace: Namespace.ID) {
		self.namespace = namespace
	}
	
    var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/button", name: nil)
				
				Text("Given an action and a label you can create a button. When a user clicks or taps the button, an action—a method or closure property—is triggered. The label is a view that can display text, an icon, or both to describe the operation of the button. Any type of view, such as a Text view for text-only labels, can be the label of a button.")
					.fontWeight(.light)
					.font(.title2)
					.padding(.bottom)
				
				/// buttons
				Group {
					customizableButton
					Divider().padding(.vertical)
					roundedButtons
					Divider().padding(.vertical)
				}
			}
		}
		.scrollIndicators(.hidden)
		.navigationBarTitleDisplayMode(.inline)
		.padding(.horizontal, 16)
    }
}

#Preview {
	ButtonsView(namespace: Namespace().wrappedValue)
}

// MARK: - Rounded Button
extension ButtonsView {
	@ViewBuilder
	var roundedButtons: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text("Rounded Button")
					.font(.title)
					.fontWeight(.heavy)
					.padding(.vertical, 5)
				Text("One of the most usual designs for buttons is to include rounded corners. You can see how to achieve that here, using a custon view modifier.")
					.fontWeight(.light)
					.font(.title2)
				
				Button(action: { }) {
					Text("Click Here")
						.modifier(ButtonFontModifier(font: Font(font)))
						.modifier(RoundedBordersModifier(radius: 10,
														 lineWidth: CGFloat(borderWidth),
														 color: colorBorder))
				}
			}
		}
	}
}

	// MARK: - CustomMizable button
extension ButtonsView {
	@ViewBuilder
	 var customizableButton: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text("Customizable button")
					.fontWeight(.heavy)
					.font(.title)
				Text("At continuation, we show a button and some properties, so that you can adjust them interactively and see how the button changes. If you change the font style to extraLargeTitle, you will need to increase the width of the button to make the size fit. Since we're showcasing how a fixed size affect s the content of a button in this case, we choose to fix a width. But you can easily give your buttons a min and max width values to make them react to different font styles.")
					.fontWeight(.light)
					.font(.title2)
				Button("change me", systemImage: "message.badge.fill",  action: {})
					.frame(width: buttonWidth, height: buttonHeight)
					.modifier(ButtonFontModifier(font: Font(UIFont.preferredFont(forTextStyle: textStyle2))))
					.background(color2)
					.modifier(RoundedBordersModifier(radius: radius2,
													 lineWidth: CGFloat(borderWidth2),
													 color: colorBorder2))
					.padding(.leading, 8)
				
				ColorPicker("Background color:",
							selection: $color2,
							supportsOpacity: false)
				
				ColorPicker("Border color:",
							selection: $colorBorder2,
							supportsOpacity: false)
				VStack(alignment: .leading) {
					HStack {
						Text("Border width:")
						Slider(value: $borderWidth2, in: 0...10, step: 1, label: {
							Text("\(borderWidth2)")
						}, minimumValueLabel: {
							Text("0")
						}, maximumValueLabel: {
							Text("10")
						}, onEditingChanged:{_ in } )
					}
					Text("current value: \(Int(borderWidth2))")
						.font(.footnote)
				}
				VStack(alignment: .leading) {
					HStack {
						Text("Frame width:")
						Slider(value: $buttonWidth, in: 50...300, step: 1, label: {
							Text("\(Int(buttonWidth))")
						}, minimumValueLabel: {
							Text("50")
						}, maximumValueLabel: {
							Text("300")
						}, onEditingChanged:{_ in } )
					}
					Text("current value: \(Int(buttonWidth))")
						.font(.footnote)
				}
				VStack(alignment: .leading) {
					HStack {
						Text("Frame height:")
						Slider(value: $buttonHeight, in: 35...100, step: 1, label: {
							Text("\(Int(buttonHeight))")
						}, minimumValueLabel: {
							Text("35")
						}, maximumValueLabel: {
							Text("100")
						}, onEditingChanged:{_ in } )
					}
					Text("current value: \(Int(buttonHeight))")
						.font(.footnote)
				}
				HStack {
					Text("Font Style:")
					FontTextStylePicker(selection: $textStyle2)
				}
			}
		}
	}
}
