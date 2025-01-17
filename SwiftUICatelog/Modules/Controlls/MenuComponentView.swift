//
//  MenuComponentView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 14/01/25.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/menu
struct MenuComponentView: View {
    var body: some View {
        Text("Hello, Menu!")
    }
}


/// https://developer.apple.com/documentation/swiftui/menustyleconfiguration
struct PinkBorderMenuStyle: MenuStyle {
	func makeBody(configuration: Configuration) -> some View {
		Menu(configuration)
			.border(Color.pink)
	}
}

#Preview {
    MenuComponentView()
}
