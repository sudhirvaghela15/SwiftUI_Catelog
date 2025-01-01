//
//  LabelsView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI
/// https://developer.apple.com/documentation/swiftui/label
/// https://developer.apple.com/documentation/swiftui/labelstyle
	
struct LabelsView: View {
	var titleOnly: TitleOnlyLabelStyle = TitleOnlyLabelStyle.init()
	var redBorderedLabelStyle: SVRedBorderedLabelStyle = .init()
	
	var body: some View {
		ScrollView {
			HStack() {
				Spacer()
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/label", name: nil)
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/labelstyle", name: nil)
					.padding(.trailing, -16)
			}
			
			VStack(alignment: .leading) {
				labelTypes
				Divider().padding(.vertical)
				labelsGroups
				Divider().padding(.vertical)
				truncationAndMultilineLabels
				Divider().padding(.vertical)
			}
			
		}.padding(.horizontal, 16)
	}
}

private extension LabelsView {
	// MARK: - labelTypes
	var labelTypes: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Group {
					Text("Label Types")
						.fontWeight(.heavy)
						.font(.title)
					Text("You can create a label in SwiftUI by adding an icon to it, using only a text or conbining text and icons in one label")
						.fontWeight(.light)
						.font(.title2)
				}
				
				VStack {
					Spacer()
					HStack {
						Text("Label with icon:")
						Spacer()
						Label("Lightning", systemImage: "bolt.fill")
					}
					Spacer()
					HStack {
						Text("Only Label:")
						Spacer()
						Label("Lightning", systemImage: "bolt.fill")
							.labelStyle(.titleOnly)
					}
					Spacer()
					HStack {
						Text("Only icon:")
						Spacer()
						Label("Lightning", systemImage: "bolt.fill")
							.labelStyle(.iconOnly)
					}
					Spacer()
					HStack {
						Text("Label icon and custom style:")
						Spacer()
						Label("Lightning", systemImage: "bolt.fill")
							.labelStyle(redBorderedLabelStyle)
					}
				}
				Spacer()
				HStack {
					Text("Label icon and font:")
					Spacer()
					Label("Lightning",
						  systemImage: "bolt.fill")
					.font(.title)
				}
			}
		}
	}
	
	// MARK: - labelsGroups
	var labelsGroups: some View {
		GroupBox {
			VStack(alignment: .leading) {
				VStack(alignment: .leading) {
					Group {
						Text( "Label groups")
							.fontWeight(.heavy)
							.font(.title)
						Text("Labels can be grouped in other containers to layout them as a group")
							.fontWeight(.light)
							.font(.title2)
						HStack {
							Spacer()
							VStack {
								Label("Rain", systemImage: "cloud.rain")
								Label("Snow", systemImage: "snow")
								Label("Sun", systemImage: "sun.max")
							}.foregroundStyle(.accent)
							Divider().padding(.vertical)
							
							VStack {
								Label("Rain", systemImage: "cloud.rain")
								Label("Snow", systemImage: "snow")
								Label("Sun", systemImage: "sun.max")
							}.labelStyle(.titleOnly)
							Divider().padding(.vertical)
							
							VStack {
								Label("Rain", systemImage: "cloud.rain")
								Label("Snow", systemImage: "snow")
								Label("Sun", systemImage: "sun.max")
							}.labelStyle(.iconOnly)
							Divider().padding(.vertical)
							Spacer()
						}
					}
				}
			}
		}
	}
	
	// MARK: - TRUNCATION AND MULTILINE
	var truncationAndMultilineLabels: some View {
		GroupBox {
			VStack(alignment: .leading) {
				Group {
					Text("Truncations and multiline")
						.fontWeight(.heavy)
						.font(.title)
					Text("Similar configuration as there were in UIKit can be applied in SwiftUI to manage truncation and multiline text in a label")
						.fontWeight(.light)
						.font(.title2)
				}
				Label(title: {
					Text("Very long text truncated")
						.multilineTextAlignment(.center)
				}, icon: { })
				.frame(width: 150, height: 100, alignment: .center)
				.lineLimit(1)
				.allowsTightening(false)
				.truncationMode(.middle)
				
				Label(title: {
					Text("Multiline text arranged in how many lines as it is needed , Multiline text arranged in how many lines as it is needed").multilineTextAlignment(.center)
					}, icon: { } )
				.lineLimit(2)
				.minimumScaleFactor(0.6)
				.allowsTightening(true)
				.truncationMode(.middle)
			}
		}
	}
}


	// MARK: - Custom Label Style
struct SVRedBorderedLabelStyle: LabelStyle {
	func makeBody(configuration: Configuration) -> some View {
		Label(configuration)
			.border(Color.red, width: 2)
	}
}
