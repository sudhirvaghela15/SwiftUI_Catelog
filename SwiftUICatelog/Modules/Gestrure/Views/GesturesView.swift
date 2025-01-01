//
//  GesturesView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//
import SwiftUI

/// https://developer.apple.com/documentation/swiftui/adding-interactivity-with-gestures
/// https://developer.apple.com/documentation/swiftui/composing-swiftui-gestures

struct GesturesView: View {
	@GestureState private var isDetectingLongPress = false
	@State private var totalNumberOfTaps = 0
	@State private var customText = "No Tap Detected yet!"
	
	var body: some View {
		let tap = TapGesture()
			.onEnded{ _ in
				self.customText = "Tap Detected!"
				print("View tapped!")
			}
		
		let lognPress = LongPressGesture(minimumDuration: 2)
			.updating($isDetectingLongPress) { currentState, gestureState, transaction in
				gestureState = currentState
			}
			.onChanged {_ in
				self.totalNumberOfTaps += 1
			}
			.onEnded { _ in
				self.customText = "Long press Detected!"
				print("View Pressed for two seconds!")
			}
		
		ScrollView {
			VStack(alignment: .leading) {
				DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/adding-interactivity-with-gestures", name: "GESTURE INTERACTIONS")
				Group {
					Text("Gesture modifiers handle all of the logic needed to process user-input events such as touches, and recognize when those events match a known gesture pattern, such as a long press or rotation. When recognizing a pattern, SwiftUI runs a callback you use to update the state of a view or perform an action.")
					Spacer()
					Label(title: {
						Text(customText).padding(.vertical)
					}, icon: {  })
					Spacer()
					Label(title: { Text("** Try Tap on objects on the left side. Try Long press on objects on the right side.")
							.font(.system(size: 14, weight: .light))
					}, icon: {  })
				}
				Spacer(minLength: 30)
				
				Group {
					Label(title: {
						Text("Circle Shape + Gesture")
					}, icon: {  })
					HStack{
						Circle()
							.fill(Color.blue)
							.frame(width: 100, height: 100, alignment: .center)
							.gesture(tap)
						
						Circle()
							.fill(Color.gray)
							.frame(width: 100, height: 100, alignment: .center)
							.gesture(lognPress)
					}
				}
				Spacer(minLength: 30)
			}
		}.padding(.horizontal, 16)
	}
}

#Preview {
	GesturesView()
}
