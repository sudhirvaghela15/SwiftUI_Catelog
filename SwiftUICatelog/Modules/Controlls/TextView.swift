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
			DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/text", name: nil)
			fontTypes
			Divider().padding(.vertical)
		}.padding(.horizontal, 16)
    }
}

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

#Preview {
    TextView()
}
