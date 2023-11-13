//
//  ViewController.swift
//  Comsigan
//
//  Created by Jaeyoon Kim on 11/13/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://comci.net:4082/st")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    // 웹뷰가 웹 컨텐츠를 모두 로드한 후에 호출되는 메서드
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 웹 페이지의 모든 요소의 너비를 화면 너비의 절반으로 설정하는 JavaScript 코드
        let script = """
        document.body.style.zoom = "0.5";
        """
        // JavaScript 코드를 실행
        webView.evaluateJavaScript(script, completionHandler: nil)
    }
}
