// https://github.com/Quick/Quick

import Quick
import Nimble
import RoktWebViewSDK

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("Test RoktWKWebView Configuration") {
            context("RoktWKWebView Configuration") {
                it("test user agent") {
                    let roktWebView = await RoktWKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        let userAgent = roktWebView.customUserAgent
                        let agentHasRoktWebViewSDK = userAgent?.contains("RoktWebViewSDK")
                        expect(agentHasRoktWebViewSDK).toEventually(beTrue())
                    }
                }
                
                it("user script placed correctly") {
                    let roktWebView = await RoktWKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                    let userscripts = await roktWebView.configuration.userContentController.userScripts

                    await expect(userscripts.filter{ $0.source.contains("RoktWebViewSDK")}.isEmpty).toEventually(beFalse(), timeout: .seconds(3))
                }
                
            }
        }
    }
}
