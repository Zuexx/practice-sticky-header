//
//  ContentView.swift
//  practice-sticky-header
//
//  Created by Zuexx on 2024/3/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ImageView()
                ActionPanelView()
                    .offset(y:-55)
                    .zIndex(1)
                GridView()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
