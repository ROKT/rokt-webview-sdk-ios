//
//  RoktWKWebView.swift
//  RoktWebViewSDK
//
//  Copyright 2020 Rokt Pte Ltd
//  Licensed under the Rokt Software Development Kit (SDK) Terms of Use
//  Version 2.0 (the "License");
//  You may not use this file except in compliance with the License.
//  You may obtain a copy of the License at https://rokt.com/sdk-license-2-0/
//

import WebKit

open class RoktWKWebView: WKWebView, WKScriptMessageHandler {
    
    private let roktWebviewScript = """
    var RoktWebViewSDK = {
         open: function(url) {
             window.webkit.messageHandlers.\(Constants.roktMessageHandler).postMessage(url);
         }
    };
    """
    
    override public init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        initialRoktWebView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(frame: .zero, configuration: WKWebViewConfiguration())
        translatesAutoresizingMaskIntoConstraints = false
        initialRoktWebView()
    }
    
    private func initialRoktWebView(){
        addMessageHandler()
        updateUserAgent()
    }
    
    internal func addMessageHandler() {
        configuration.userContentController.add(self, name: Constants.roktMessageHandler)
        configuration.userContentController.addUserScript(
            WKUserScript(source: roktWebviewScript,
                         injectionTime: WKUserScriptInjectionTime.atDocumentStart,
                         forMainFrameOnly: false))
        
    }
    
    internal func updateUserAgent() {
        evaluateJavaScript(Constants.navigatorUserAgent) {(result, error) in
            if let userAgent = result as? String {
                self.customUserAgent = userAgent + Constants.customUserAgent
            }
        }
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == Constants.roktMessageHandler {
            if let urlString = message.body as? String,
                let url = URL(string: urlString) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
