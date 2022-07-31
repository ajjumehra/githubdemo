//
//  WebView.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation
import SwiftUI
import UIKit
import WebKit

// MARK: - WebView

struct WebView: UIViewRepresentable {
    var url: URL?

    // Make a coordinator to co-ordinate with WKWebView's default delegate functions
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()

        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        // Load a public website
        if let url = url {
            webView.load(URLRequest(url: url))
        }
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ uiWebView: WebView) {
            self.parent = uiWebView
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {}

        func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {}

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {}

        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {}

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {}
    }
}
