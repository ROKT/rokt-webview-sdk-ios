// https://github.com/Quick/Quick

import Quick
import Nimble
import RoktWebViewSDK

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("Test RoktWKWebView Configuration") {
            context("RoktWKWebView Configuration") {
                
                it("test user agent") {
                    let roktWebView = RoktWKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                    expect(roktWebView.customUserAgent?.contains("RoktWebViewSDK")).toEventually(beTrue())
                }
                
                it("user script placed correctly") {
                    let roktWebView = RoktWKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                    let userscripts = roktWebView.configuration.userContentController.userScripts
                    
                    expect(userscripts.filter{ $0.source.contains("RoktWebViewSDK")}.isEmpty).toEventually(beFalse())
                }
                
            }
        }
    }
}
