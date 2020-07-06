//
//  ViewController.swift
//  RoktWebViewSDK
//
//  Copyright 2020 Rokt Pte Ltd
//  Licensed under the Rokt Software Development Kit (SDK) Terms of Use
//  Version 2.0 (the "License");
//  You may not use this file except in compliance with the License.
//  You may obtain a copy of the License at https://rokt.com/sdk-license-2-0/
//

import UIKit
import WebKit
import RoktWebViewSDK

class ViewController: UIViewController {

    @IBOutlet weak var urlTextView: UITextField!
    @IBOutlet weak var roktWKWebview: RoktWKWebView!
    
    private let sampleHtmlString = """
        <html>
            <button onclick=\"RoktWebViewSDK.open('https://rokt.com')\">
                Open Link in External Browser</button>
        </html>
        """
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loadWebURL(_ sender: Any) {
        roktWKWebview.load(URLRequest(url: URL(string: urlTextView.text!)!))
    }
    
    @IBAction func loadMockData(_ sender: Any) {
        roktWKWebview.loadHTMLString(sampleHtmlString, baseURL: nil)
    }
    
}

