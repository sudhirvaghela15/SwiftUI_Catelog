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
					Section(header:
						Text("Controls")
						.textVariant(.sizeDependent)
						.modifier(ListSectionFontModifier())
					) {
						Group {
							NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Button") })
							
							NavigationLink(destination: ImagesComponentView(), label: { Text("Images") })
							
							NavigationLink(
								destination: TextView() ,
								label: { Text("Texts")
								})
							
							NavigationLink(destination: LabelsView(), label: { Text("Labels") })
							
							NavigationLink(destination: Text("Menus"), label: { Text("Menus") })
						}
					
						Group {
							NavigationLink(destination: Text("Toggles"), label: { Text("Toggles") })
							
							NavigationLink(destination: Text("Sliders"), label: { Text("Sliders") })
							
							NavigationLink(destination: Text("Steppers"), label: { Text("Steppers") })
							
							NavigationLink(destination: Text("Pickers"), label: { Text("Pickers") })
							
							NavigationLink(destination: Text("Date Picker"), label: { Text("Date Pickers") })
							
							NavigationLink(destination: Text("Color Picker"), label: { Text("Color Pickers") })
							
							NavigationLink(destination: Text("Progress View"), label: { Text("Progress View") })
							
						}
					}.listRowBackground(Color.indigo)
						.listRowInsets(
							EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16)
						)
						.listRowSeparatorTint(Color.orange)
						.font(.title2.weight(.bold))
					
				}
			}.navigationTitle("Swift UI Catelog")
//			.navigationDestinationControll(namespace)
		}
	}
}

#Preview {
	HomeView()
}
