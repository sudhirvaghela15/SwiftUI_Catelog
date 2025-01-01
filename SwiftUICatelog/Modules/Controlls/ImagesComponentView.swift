//
//  ImagesComponentView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/image
struct ImagesComponentView: View {
    var body: some View {
		ScrollView {
			HStack() {
				Spacer()
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/image", name: "IMAGE VIEW")
			}
			sfSymbols
			Divider().padding(.vertical)
			imagesFromBundle
			
			
		}.padding(.horizontal, 16)
    }
}

private extension ImagesComponentView {
	var sfSymbols: some View {
		GroupBox {
			VStack {
				Text("Images with SF Symbols")
					.fontWeight(.heavy)
					.font(.title)
				Text("SF Symbols is a collection of iconography that has over 5,000 symbols and is made to work perfectly with San Francisco, the system font used by Apple platforms. Symbols automatically align with text and are available in three scales and nine weights. Using vector graphics editing software, they can be altered and exported to produce unique symbols with shared accessibility features and design elements. With SF Symbols 5, you can now create bespoke symbols with improved tools, over 700 new symbols, and a variety of expressive animations. You can find more about SF Symbols in [the SF Official page](https://developer.apple.com/design/resources/#sf-symbols)")
					.fontWeight(.light)
					.font(.title2)
				ScrollView(.horizontal) {
					HStack(alignment: .center, spacing: 20) {
						Image(systemName: "house.circle")
						Image(systemName: "square.circle")
						Image(systemName: "dpad")
						Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
						Image(systemName: "eraser")
						Image(systemName: "paperplane.circle")
						Image(systemName: "externaldrive.connected.to.line.below")
						Image(systemName: "keyboard.badge.eye")
						Image(systemName: "printer.dotmatrix.fill")
						Image(systemName: "figure.2")
						Image(systemName: "figure.2.circle")
						Image(systemName: "eye")
						Image(systemName: "eye.fill")
						Image(systemName: "textformat.size")
						Image(systemName: "checkmark.seal.fill")
						Image(systemName: "exclamationmark.bubble.circle")
					}
					.frame(maxWidth: .infinity)
					.padding(.vertical)
				}
			}
		}
	}
}


private extension ImagesComponentView {
	var imagesFromBundle: some View {
		VStack(alignment: .leading) {
			Text("Images from Bundle")
				.fontWeight(.heavy)
				.font(.title)
			Text("Images can be uploaded from the app bundle, just the same as with UIKit, images can be scaled, resized, tiled, framed and also you can overlays on top of images to mask them to different shapes.")
				.fontWeight(.light)
				.font(.title2)
			
			Text("Image scaled to fit")
				.fontWeight(.semibold)
				.padding(.top)
			Image(systemName: "hands.and.sparkles.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 200, height: 200)
			Divider().padding(.vertical)
			
			Text("Image scaled to fill")
				.fontWeight(.semibold)
			Image(systemName: "hands.and.sparkles.fill")
				.resizable()
				.scaledToFill()
				.frame(width: 200, height: 200)
			Divider().padding(.vertical)
			
			Text("Aspect ratio fit")
				.fontWeight(.semibold)
			Image(systemName: "hands.and.sparkles.fill")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 200, height: 200)
			Divider().padding(.vertical)
			
			Text("Aspect ratio fill")
				.fontWeight(.semibold)
			Image(systemName: "hands.and.sparkles.fill")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 200, height: 200)
			Divider().padding(.vertical)

			Text("Circled overlay")
				.fontWeight(.semibold)
			Image(systemName: "hands.and.sparkles.fill")
				.resizable()
				.scaledToFit()
				.overlay(content: {
					Color.gray
						.opacity(0.5)
				}).clipShape(Circle())
				.frame(width: 200, height: 200)
			Divider().padding(.vertical)
		}
	}
}


#Preview {
    ImagesComponentView()
}
