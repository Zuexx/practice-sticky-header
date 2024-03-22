//
//  ActionPanelView.swift
//  practice-sticky-header
//
//  Created by Zuexx on 2024/3/21.
//

import SwiftUI

struct ActionPanelView: View {
    var body: some View {
        GeometryReader { geo in
            // Get minY value from the global coordinate space
            // located at the root of the view hierarchy.
            let minY = geo.frame(in: .global).minY

            /*
             HStack
                .offset: Set the maximum value for the y-axis, when minY is greater than or equal to 60.
                         Then stop updating the y-axis value, which ensures the entire control
                         set remains sticky at the top position.
             */
            HStack {
                Button {} label: {
                    Label("message", systemImage: "message")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 240, height: 45)
                        .background(
                            .ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: 30)
                        )
                }

                ButtonView(iconName: "apple.logo", action: {})
                    .foregroundColor(.white)
                ButtonView(iconName: "playstation.logo", action: {})
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .offset(y: max(60 - minY, 0))
        }
    }
}

#Preview {
    ActionPanelView()
}
