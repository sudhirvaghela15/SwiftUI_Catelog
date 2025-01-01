//
//  TextView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/text
struct TextView: View {
	
	@State private var textFieldValue: String = ""
	@State private var secureFieldValue: String = ""
	
    var body: some View {
		ScrollView {
			HStack() {
				Spacer()
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/text", name: nil)
			}
			fontTypes
			Divider().padding(.vertical)
			fontWeights
			Divider().padding(.vertical)
			fontModifier
			Divider().padding(.vertical)
			textTrunction
			Divider().padding(.vertical)
		}.padding(.horizontal, 16)
    }
}
	// MARK: - font types
extension TextView {
	private var fontTypes: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text("Available fonts")
					.fontWeight(.heavy)
					.font(.title)
				Text("To apply a specific font to an individual Text View you can use the font modifier. There are already different type of fonts pre-defined")
					.fontWeight(.light)
					.font(.title2)
				
				HStack {
					Spacer()
					VStack(alignment: .center) {
						Text("Headline")
							.font(.headline)
						Text("Sub headline")
							.font(.subheadline)
						Text("Large Title")
							.font(.largeTitle)
						Text("Title")
							.font(.title)
						Text("Title 2")
							.font(.title2)
						Text("Title 3")
							.font(.title3)
						Text("Body")
							.font(.body)
						Text("Callout")
							.font(.callout)
						Text("Caption")
							.font(.caption)
						Text("Caption 2")
							.font(.caption2)
						Text("Footnote")
							.font(.footnote)
					}
					Spacer()
				}
			}
		}
	}
}

	// MARK: - fontWeights
extension TextView {
	private var fontWeights: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text("Available font weights")
					.font(.title)
					.fontWeight(.heavy)
				
				Text("Font can also be assigned a weight, which change the appereance of the font.")
					.fontWeight(.light)
					.font(.title2)
				
				HStack {
					Spacer()
					VStack(alignment: .center) {
						Text("Weight Black")
							.fontWeight(.black)
						Text("Weight Heavy")
							.fontWeight(.heavy)
						Text("Weight bold")
							.fontWeight(.bold)
						Text("Weight semi bold")
							.fontWeight(.semibold)
						Text("Weight Medium")
							.fontWeight(.medium)
						Text("Weight Regular")
							.fontWeight(.regular)
						Text("Weight Light")
							.fontWeight(.light)
						Text("Weight Ultra Light")
							.fontWeight(.ultraLight)
						Text("Weight Thin")
							.fontWeight(.thin)
					}
					Spacer()
				}
			}
		}
	}
}

	// MARK: - Font modifier
extension TextView {
	private var fontModifier: some View {
		GroupBox {
			VStack(alignment: .leading, content: {
				Text("Text, italic, bold")
					.fontWeight(.heavy)
					.font(.title)
				HStack {
					Spacer()
					VStack(alignment: .center) {
						Text("Italic")
							.italic()
						Text("Bold")
							.bold()
						Text("Underline")
							.underline()
						Text("Strike Through")
							.strikethrough()
						Text("Kerning")
							.kerning(4)
						Text("Tracking")
							.tracking(3)
						Text("With Shadow")
							.shadow(color: .green, radius: 12, x: 1, y: 2)
					}
					Spacer()
				}
			})
		}
	}
}

	// MARK: - Text Trunction

extension TextView {
	private var textTrunction: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Text("Text Truncations and multiline")
					.fontWeight(.heavy)
					.font(.title)
				Text("Very long text truncated")
					.frame(width: 150)
					.lineLimit(1)
					.minimumScaleFactor(0.8)
					.allowsTightening(false)
					.truncationMode(.middle)
				Text("Multiline text arranged in how many lines as it is needed")
					.multilineTextAlignment(.center)
			}
		}
	}
}

#Preview {
    TextView()
}
