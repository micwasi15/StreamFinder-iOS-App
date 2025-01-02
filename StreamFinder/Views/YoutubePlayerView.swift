import SwiftUI
import WebKit

import SwiftUI
import WebKit

import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    var videoURL: String

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true // Pozwala na odtwarzanie w miejscu
        configuration.mediaTypesRequiringUserActionForPlayback = [] // Automatyczne odtwarzanie (jeśli dozwolone)

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.isUserInteractionEnabled = true
        webView.uiDelegate = context.coordinator // Ustawienie delegata
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let videoID = extractVideoID(from: videoURL) {
            let urlString = "https://www.youtube.com/embed/\(videoID)?autohide=1&showinfo=0&modestbranding=1&rel=0&playsinline=1"
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }

    func extractVideoID(from url: String) -> String? {
        if let urlComponents = URLComponents(string: url) {
            for queryItem in urlComponents.queryItems ?? [] {
                if queryItem.name == "v" {
                    return queryItem.value
                }
            }
        }
        return nil
    }

    // Coordinator to handle UI-related interactions
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    class Coordinator: NSObject, WKUIDelegate {
        // Handle attempts to present content in a new window (e.g., full-screen video)
        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            return nil // Block opening new windows (including full-screen)
        }
    }
}
