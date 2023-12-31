//
//  VetCodingApp.swift
//  VetCoding
//
//  Created by Matt Koenig on 6/10/23.
//

import SwiftUI
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct VetCodingFinalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            if viewModel.signedIn {
                ContentView()
                    .environmentObject(viewModel)
            } else {
                Authentication()
                    .environmentObject(viewModel)
            }
        }
    }
}
