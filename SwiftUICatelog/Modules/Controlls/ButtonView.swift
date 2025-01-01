//
//  ButtonView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/button

struct ButtonsView: View {
	private let namespace: Namespace.ID
	
	init(namespace: Namespace.ID) {
		self.namespace = namespace
	}
	
    var body: some View {
        Text("Hello, Button!")
    }
}

#Preview {
	ButtonsView(namespace: Namespace().wrappedValue)
}


