//
//  ImageView.swift
//  practice-sticky-header
//
//  Created by Zuexx on 2024/3/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        GeometryReader { geo in

            // Get minY value from the global coordinate space
            // located at the root of the view hierarchy.
            let minY = geo.frame(in: .global).minY
            let isScrolling = minY > 0

            VStack {
                /*
                 Image
                    .frame: When isScrolling is true, update the frame height to the original value plus the minY value.
                    .offset: When isScrolling is true, update the offset value to be -minY, which keeps the image position snapped to the top edge of the screen.
                    .blur: When isScrolling is true, update the blur effect depends on minY value.
                    .scaleEffect: When isScrolling is true, set the scale effect depends on minY value.

                    .overlay
                        ZStack
                            .offset: When isScrolling is true, udpate the offset value to default - minY to keep the avatar as expected with scrolling behavior
                 */
                Image(.biker)
                    .resizable()
                    .scaledToFill()
                    .frame(height: isScrolling ? 220 + minY : 220)
                    .clipped()
                    .offset(y: isScrolling ? -minY : 0)
                    .blur(radius: isScrolling ? 0 + minY / 80 : 0)
                    .scaleEffect(isScrolling ? 1 + minY / 2000 : 1)
                    .overlay(alignment: .bottom) {
                        ZStack {
                            Image(.bikerAvatar)
                                .resizable()
                                .scaledToFit()
                            Circle().stroke(lineWidth: 6)
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .offset(y: isScrolling ? 50 - minY : 50)
                    }

                Group {
                    VStack(spacing: 15) {
                        Text("ZUEXX").bold().font(.title)
                        Text("I'm all about creating efficient and scalable applications that follow the best coding practices and design patterns. When I'm not coding, I'm out exploring the world and capturing its beauty through my lens.")
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .frame(width: geo.size.width - 30)
                            .lineLimit(5)
                    }
                    .offset(y: isScrolling ? -minY : 0)
                }
                .padding(.vertical, 53)
                .padding(.horizontal, 10)
            }
        }
        .frame(height: 500)
    }
}

#Preview {
    ImageView()
}
