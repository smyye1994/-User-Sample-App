//
//  AViewController.swift
//  9.Hafta
//
//  Created by Sümeyye Kılıçoğlu on 5.09.2022.
//

import UIKit
import WebKit
protocol AViewControllerDelegate {
     
}

class AViewController: UIViewController {
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,
        configuration: configuration)
      
     
        return webView
    }()
    var delegate: AViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: "https://www.themoviedb.org/") else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.customUserAgent = "İphone/Chrome/SomethingRondom"
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
                guard let html = result as?  String, error == nil else {
                    return
                }
            print(html)
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

}
