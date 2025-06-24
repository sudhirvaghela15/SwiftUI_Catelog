//
//  HomeView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//


import SwiftUI

struct HomeView: View {
	@State private var navigationPath = [Controlls]()
	@Namespace private var namespace
		
	var body: some View {
		NavigationStack(path: $navigationPath) {
			ZStack {
				Color.accentColor.ignoresSafeArea()
				List {
					controllsSection
					gestureSection
					viewModifiers
				}
			}.navigationTitle("Swift UI Catelog")
				.navigationBarTitleDisplayMode(.inline)
				.padding()
				.ignoresSafeArea(.all, edges: [.bottom, .leading, .trailing])
//			.navigationDestinationControll(namespace)
		}
	}
	
	private var controllsSection: some View  {
		Section(header:
			Text("Controls")
			.textVariant(.sizeDependent)
			.modifier(ListSectionFontModifier())
		) {
			Group {
				NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Button") })
				NavigationLink(destination: ImagesComponentView(), label: { Text("Images") })
				NavigationLink(destination: TextView() ,label: { Text("Texts") })
				NavigationLink(destination: LabelsView(), label: { Text("Labels") })
				NavigationLink(destination: TogglesView(), label: { Text("Toggles") })
				NavigationLink(destination: SlidersView(), label: { Text("Sliders") })
			}
		
			Group {
				NavigationLink(destination: MenuComponentView(), label: { Text("Menus") })
				NavigationLink(destination: SteppersComponentsView(), label: { Text("Steppers") })
				NavigationLink(destination: PickerComponentsView(), label: { Text("Pickers") })
//				NavigationLink(destination: Text("Date Picker"), label: { Text("Date Pickers") })
//							NavigationLink(destination: Text("Color Picker"), label: { Text("Color Pickers") })
//							NavigationLink(destination: Text("Progress View"), label: { Text("Progress View") })
			}
		}.listRowBackground(Color.indigo)
			.listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
			.listRowSeparatorTint(Color.orange)
			.font(.title2.weight(.bold))
	}
	
	private var gestureSection: some View {
		Section(header: Text("Gestures")
			.modifier(ListSectionFontModifier())) {
				NavigationLink(destination: GesturesView(), label: { Text("Gestures") })
				NavigationLink(destination: ComposingGesturesView(), label: { Text("Composing Gestures") })
			}
			.listRowBackground(Color.accentColor)
			.listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
			.listRowSeparatorTint(Color.orange)
			.font(.title2.weight(.bold))
		
	}
	
	private var viewModifiers: some View {
		Section(header: Text("View Modifiers")
			.modifier(ListSectionFontModifier())) {
				NavigationLink(destination: Text("Text Modifiers"), label: { Text("Text Modifiers") })
				NavigationLink(destination: Text("Effect Modifiers"), label: { Text("Effect Modifiers") })
				NavigationLink(destination: Text("Layout Modifiers"), label: { Text("Layout Modifiers") })
			}.listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
			.listRowSeparatorTint(Color.orange)
			.font(.title2.weight(.bold))
			.listRowBackground(Color.accentColor)
		
	}
}

#Preview {
	HomeView()
}
