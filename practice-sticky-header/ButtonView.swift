//
//  ButtonView.swift
//  practice-sticky-header
//
//  Created by Zuexx on 2024/3/21.
//

import SwiftUI

struct ButtonView: View {
    let iconName : String
    let action :() -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 24, height:24)
                .padding(10)
                .background(.ultraThinMaterial, in: Circle())
                .overlay {
                    Circle()
                        .stroke(lineWidth:1)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.gray]),
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing))
                }
        }
    }
}

#Preview {
    ButtonView(iconName: "apple.logo", action: {})
}
