//
//  ComposingGesturesView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/adding-interactivity-with-gestures
/// https://developer.apple.com/documentation/swiftui/composing-swiftui-

struct ComposingGesturesView: View {
	
	@GestureState private var dragState = DragState.inactive
	@State private var viewState = CGSize.zero
	private let minimumLongPressDuration = 0.5
	
	var body: some View {
		let longPressGesture = LongPressGesture(minimumDuration: minimumLongPressDuration)
			.sequenced(before: DragGesture())
			.updating($dragState) { value, state, transaction in
				switch value {
					// Long press begins.
				case .first(true):
					state = .pressing
					// Long press confirmed, dragging may begin.
				case .second(true, let drag):
					state = .dragging(translation: drag?.translation ?? .zero)
					// Dragging ended or the long press cancelled.
				default:
					state = .inactive
				}
			}
			.onEnded { value in
				guard case .second(true, let drag?) = value else { return }
				self.viewState.width += drag.translation.width
				self.viewState.height += drag.translation.height
			}
		
		ScrollView {
			VStack(alignment: .leading) {
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/adding-interactivity-with-gestures", name: "GESTURES")
				
				Text("Try to click and hold your finger, then drag the circle and enjoy this gesture in SwiftUI.")
					.fontWeight(.light)
					.font(.title2)
				Text("Offset = x: \(viewState.width + dragState.translation.width) - y: \(viewState.height + dragState.translation.height)")
				Circle()
					.fill(Color.blue)
					.overlay(dragState.isDragging ? Circle().stroke(Color.white, lineWidth: 2) : nil)
					.frame(width: 100, height: 100, alignment: .center)
					.offset(
						x: viewState.width + dragState.translation.width,
						y: viewState.height + dragState.translation.height
					)
					.animation(.easeInOut, value: dragState)
					.shadow(radius: dragState.isActive ? 8 : 0)
					.animation(.linear(duration: minimumLongPressDuration), value: dragState)
					.gesture(longPressGesture)
			}
		}
		.padding(.horizontal, 16)
	}
}
