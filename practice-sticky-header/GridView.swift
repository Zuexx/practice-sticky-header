//
//  GridView.swift
//  practice-sticky-header
//
//  Created by Zuexx on 2024/3/20.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
            ForEach(0 ..< 25) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180, height: 220)
                    .foregroundStyle(.ultraThinMaterial)
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    GridView()
}
