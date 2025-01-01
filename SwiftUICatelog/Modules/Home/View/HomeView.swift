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
			List {
				Section(header:
					Text("Controls")
					.textVariant(.sizeDependent)
					.modifier(ListSectionFontModifier())
				) {
					Group {
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Button") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Images") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Texts") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Labels") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Menus") })
					}
				
					Group {
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Toggles") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Sliders") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Steppers") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Pickers") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Date Pickers") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Color Pickers") })
						
						NavigationLink(destination: ButtonsView(namespace: namespace), label: { Text("Progress View") })
						
					}
				}.listRowBackground(Color.indigo)
					.listRowInsets(
						EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16)
					)
					.listRowSeparatorTint(Color.orange)
					.font(.title2.weight(.bold))
				
			}.navigationTitle("Swift UI Catelog")
//			.navigationDestinationControll(namespace)
		}
	}
}

#Preview {
	HomeView()
}
