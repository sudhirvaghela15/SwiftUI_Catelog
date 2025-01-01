//
//  Controlls.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

enum Controlls: Equatable, Hashable, Identifiable {
	case Buttons
	case Images
	case Texts
	case Labels
	case Menus
	
	case Toggles
	case Sliders
	case Steppers
	case Pickers
	case DatePickers
	case ColorPickers
	case ProgressView
	
	var id: Int {
		switch self {
			case .Buttons: 201
			case .Images: 202
			case .Texts: 203
			case .Labels: 204
			case .Menus: 205
			case .Toggles: 206
			case .Sliders: 207
			case .Steppers: 208
			case .Pickers: 209
			case .DatePickers: 210
			case .ColorPickers: 211
			case .ProgressView: 212
		}
		
	}
	
	private static var group1: [Controlls] = [
		.Images,
		.Texts,
		.Labels,
		.Menus
	]
	
	private static var group2: [Controlls] = [
		.Toggles,
		.Sliders,
		.Steppers,
		.Pickers,
		.DatePickers,
		.ColorPickers,
		.ProgressView
	]
	
	static var groups: [[Controlls]] = [group1, group2]
}
