//
//  DocumentationLinkView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

struct DocumentationLinkView: View {
	
	private var id: String {
		return link
	}
	
	private let link: String

	private let name: String
	
	@State private var isSheetPresented: Bool = false
	
	init(link: String, name: String? = nil) {
		self.link = link
		self.name = name ?? "Documentation"
	}
	
	var body: some View {
		Button(action: {
			isSheetPresented = true
		}, label: {
			HStack {
				Image(systemName: "book.and.wrench")
					.padding(12)
					.fontWeight(.bold)
					.foregroundColor(Color.black)
					.background(.primary)
					.modifier(RoundedBordersModifier(radius: 8, lineWidth: 1))
			}
		}).padding(15)
			.sheet(isPresented: $isSheetPresented, content: {
				WebView(url: URL(string: link)!)
			})
	}
}


#Preview {
	DocumentationLinkView(link: "www.apple.com")
}
