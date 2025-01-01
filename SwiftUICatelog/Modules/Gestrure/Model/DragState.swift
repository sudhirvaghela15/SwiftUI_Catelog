//
//  DragState.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI

enum DragState: Equatable {
		case inactive
		case pressing
		case dragging(translation: CGSize)
		
		var translation: CGSize {
			switch self {
			case .inactive, .pressing:
				return .zero
			case .dragging(let translation):
				return translation
			}
		}
		
		var isActive: Bool {
			switch self {
			case .inactive:
				return false
			case .pressing, .dragging:
				return true
			}
		}
		
		var isDragging: Bool {
			switch self {
			case .inactive, .pressing:
				return false
			case .dragging:
				return true
			}
		}
	}
