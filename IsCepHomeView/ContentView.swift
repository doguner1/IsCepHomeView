//
//  ContentView.swift
//  IsCepHomeView
//
//  Created by qwerty on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var vm = IsInactive()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        ZStack {
            if vm.isInactive {
                GIFView(gifName: "linkedin")
                    .ignoresSafeArea()
                    .transition(.opacity)
            } else {
                IsCepHomeView()
            }
        }
        .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase == .inactive {
                vm.isInactive = true
            } else if newScenePhase == .active {
                vm.isInactive = false
            }
        }
    }
}

#Preview {
    ContentView()
}
