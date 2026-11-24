import SwiftUI
import WebKit

@main
struct ZhishiKebiaoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .ignoresSafeArea()
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZhishiWebView()
            .background(Color(red: 0.035, green: 0.059, blue: 0.125))
            .ignoresSafeArea()
    }
}

struct ZhishiWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let cfg = WKWebViewConfiguration()
        cfg.allowsInlineMediaPlayback = true
        cfg.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        let webView = WKWebView(frame: .zero, configuration: cfg)
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 0.035, green: 0.059, blue: 0.125, alpha: 1.0)
        webView.scrollView.bounces = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
