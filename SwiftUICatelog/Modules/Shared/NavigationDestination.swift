//
//  ControllDestination.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

extension View {
	func navigationDestinationControll(_ namespace: Namespace.ID) -> some View {
		self.modifier(NavigationDestinationControll(namespace: namespace))
	}
}


private struct NavigationDestinationControll: ViewModifier {

	var namespace: Namespace.ID
	
	init(namespace: Namespace.ID) {
		self.namespace = namespace
	}
	
	func body(content: Content) -> some View {
		content.navigationDestination(for: Controlls.self) { node in
				
		}
	}
}
