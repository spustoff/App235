//
//  App235App.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    @AppStorage("random_id") var random_id: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationsGetStarted()
        
        OneSignal.initialize("a32895b8-83db-4a84-b276-9f5e758d3484", withLaunchOptions: launchOptions)
        OneSignal.login(random_id)
        
        Apphud.start(apiKey: "app_powntqFX1Q6icD81EkvK5YYHP9UfAa")
        Amplitude.instance().initializeApiKey("436b6169c3580db8f3642d6ca833ba2c")
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    @AppStorage("random_id") var random_id: String = ""
    
    if random_id.isEmpty {
        
        let randomId = Int.random(in: 1...99999)
        random_id = "\(randomId)"
    }
    
    var url = "https://onesignal-ba.com/api/os/Oi2w5l6yfXq13Hp04MhL/"
    
    url += random_id
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App235App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
