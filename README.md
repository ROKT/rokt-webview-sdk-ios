# RoktWebViewSDK iOS

**Please note:** This repository is currently unmaintained by a team of developers at Rokt. The repository is here and you can use it as an example only. However please be aware that we are not going to be updating issues or pull requests on this repository for the time being. We may resume development in the future at which point we will review the code, update dependencies, and conduct any modernization.

An alternative approach to integration would be utilising the [Rokt Web SDK](https://docs.rokt.com/developers/integration-guides/web/overview) and utilising the launcher option [overrideLinkNavigation](https://docs.rokt.com/developers/integration-guides/web/library/integration-launcher-options/#override-link-navigation). 

---

## Resident Experts

- Thomson Thomas - thomson.thomas@rokt.com

---

The RoktWebView SDK for iOS is a custom WebView that opens Rokt links in an external browser instead of in the same WebView. 

For more information, please visit [here](https://docs.rokt.com/docs/sdk/introduction.html)

## Architecture

The RoktWebViewSDK follows a simple, lightweight architecture:

- **RoktWKWebView**: The core component of the SDK that extends Apple's WKWebView. It injects JavaScript to intercept link clicks and handles opening them in an external browser.
- **Communication Mechanism**: Uses WKScriptMessageHandler to facilitate communication between JavaScript and native code.
- **Link Handling**: When a link is clicked, it's captured by injected JavaScript and sent to the native layer, which then opens the URL in the device's default browser.

The SDK is designed to be minimal, focusing on a single responsibility: redirecting web links to an external browser rather than loading them within the WebView itself.

## Usage

The below instructions assume that you are replacing the WKWebView for iOS with the Rokt WebView. The overall process is very simple to complete and the exact approach will depend on whether the WebView is initialised programmatically or not.

### Step 1: Add the Rokt WebView SDK pod to the pod file

Add the Rokt WebView SDK pod to the pod file
```
use_frameworks!
pod 'RoktWebViewSDK'
```

### Step 2: Add the Rokt WebView SDK to your layout

In storyboard, replace WKWebView with RoktWKWebView Custom Class.

![Storyboard presentation](https://roktcdn1.akamaized.net/store/imgs/ios/roktwkwebviewcustomclasspresentation.png)

Alternatively, the Rokt WebView SDK can be added programmatically in your code. For example:

**Swift**
```
import RoktWebViewSDK
...
var roktWKWebView = RoktWKWebView(frame: self.view.frame)
```

**Objective-C**
```
#import <RoktWebViewSDK/RoktWebViewSDK-Swift.h>
...
RoktWKWebView *roktWKWebView = [[RoktWKWebView alloc] initWithFrame:self.view.frame];
```
### Step 3: Load a web page
To load a web page in the RoktWKWebView, use load() for Swift or loadRequest() for Objective-C. 

**Swift**
```
roktWKWebView.load(URLRequest(url: URL(string: "https://www.rokt.com")!))
```

**Objective-C**
```
NSURL *nsurl=[NSURL URLWithString:@"https://www.rokt.com"];
NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
[roktWKWebView loadRequest:nsrequest];
```

## Testing locally
1. Download the source code locally
2. Run the `RoktWebViewSDK.xcworkspace` project in `Example`
