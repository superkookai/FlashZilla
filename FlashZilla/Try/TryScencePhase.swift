//
//  TryScencePhase.swift
//  FlashZilla
//
//  Created by Weerawut Chaiyasomboon on 18/11/2567 BE.
//

import SwiftUI

struct TryScencePhase: View {
    @Environment(\.scenePhase) var scenePhase

        var body: some View {
            Text("Hello, world!")
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    if newPhase == .active {
                        print("Active")
                    } else if newPhase == .inactive {
                        print("Inactive")
                    } else if newPhase == .background {
                        print("Background")
                    }
                }
        }
}

#Preview {
    TryScencePhase()
}
