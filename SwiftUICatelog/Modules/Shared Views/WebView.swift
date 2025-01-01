//
//  WebView.swift
//  SwiftUICatelog
//
//  Created by sudhir on 01/01/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable, Identifiable {
	var id: String {
		return url.absoluteString
	}
	
	private let url: URL
	private let delegate: SVWebViewDelegate
	
	init(url: URL) {
		self.url = url
		self.delegate =  SVWebViewDelegate(url: url)
	}
	
	func makeUIView(context: Context) -> WKWebView {
		let webView = WKWebView()
		webView.navigationDelegate = delegate
		return webView
	}
	
	func updateUIView(_ webView: WKWebView, context: Context) {
		let request = URLRequest(url: url)
		webView.navigationDelegate = delegate
		webView.load(request)
	}
}


final class SVWebViewDelegate: NSObject, WKNavigationDelegate {
	private let url: URL
	
	init(url: URL) {
		self.url = url
	}
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
		guard let urlToOpen = navigationAction.request.url,
			  urlToOpen.absoluteString == url.absoluteString else {
			return .cancel
		}
		return .allow
	}
}
