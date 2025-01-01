//
//  TogglesView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

//https://developer.apple.com/documentation/swiftui/toggle
struct TogglesView: View {
	
	@State var isBasicToggleOn: Bool = true
	@State var isSwitchToggleOn: Bool = true
	@State var isCustomToggleOn: Bool = true
	@State var isButtonToggleOn: Bool = true
	
    var body: some View {
		Group {
			VStack(alignment: .leading) {
				HStack() {
					Spacer()
					DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/toggle", name: "TOGGLES")
				}
				GroupBox {
					defaultToggle
					Divider().padding(.vertical)
					switchToggle
					Divider().padding(.vertical)
					customToggle
					Divider().padding(.vertical)
					toggleWithStyle
				}
			}
		}
    }
}

private extension TogglesView {
	var defaultToggle: some View {
		Group {
			Text("The default toggle style is 'switch', which draws a rounded rectangle with a tint color, usually green, that can be changed.")
				.fontWeight(.light)
				.font(.title2)
			Toggle(isOn: $isBasicToggleOn, label: {
				Text("Default Toggle Style")
			}).padding(.trailing, 8)
			.toggleStyle(.automatic)
		}
	}
	
	var switchToggle: some View {
		Group {
			Toggle(isOn: $isSwitchToggleOn, label: {
				Text("Switch Toggle Style")
			}).padding(.trailing, 8)
				.tint(.purple)
				.toggleStyle(.switch)
		}
	}
	
	var customToggle: some View {
		Group {
			Text("In this custom toggle, the background color has changed and there is a narrower indicator when the toggle is switched.")
				.fontWeight(.light)
				.font(.title2)
			Toggle(isOn: $isCustomToggleOn, label: {
				Text("Custom Toggle Style")
			}).padding(.trailing, 8)
				.toggleStyle(.custom)
				.frame(maxWidth: .infinity)
		}
	}
	
	var toggleWithStyle: some View {
		Group {
			Text("In this toggle we have assigned a custom BUTTON style, therefore the behaviour of the component keeps working as a toggle but it looks like a button, switching on and off the associated value.")
				.fontWeight(.light)
				.font(.title2)
			
			Toggle(isOn: $isButtonToggleOn, label: {
				Text("Button Toggle Style")
					.frame(maxWidth: .infinity)
			}).padding(.trailing, 8)
				.toggleStyle(.button)
				.tint(.purple)
		}
	}
}

struct CustomToggleStyle: ToggleStyle {
	func makeBody(configuration: ToggleStyle.Configuration) -> some View {
		HStack {
			configuration.label
			Spacer()
			Button(action: {
					configuration.isOn = !configuration.isOn
				}, label: {
					Rectangle()
						.fill(configuration.isOn ? Color.purple : .blue.opacity(0.5))
						.frame(width: 50, height: 30)
						.overlay(
							Ellipse()
								.frame(	width: 20, height: configuration.isOn ? 20 : 5)
								.foregroundColor(.white)
								.offset(x: configuration.isOn ? 11 : -11, y: 0)
								.animation(.easeInOut, value: configuration.isOn)
						).cornerRadius(20)
				}
			).buttonStyle(.plain)
		}
	}
}

extension ToggleStyle where Self == CustomToggleStyle {
	static var custom: CustomToggleStyle  { CustomToggleStyle() }
}

#Preview {
    TogglesView()
}
