//
//  HomeHeaderView.swift
//  Resizable Header
//
//  Created by Mohamed Shemy on 06/05/2023.
//

import SwiftUI
import SHKit

extension HomeView {
    
    struct HeaderView: View {
        
        var height: CGFloat
        var minHeight: CGFloat
        var topPadding: CGFloat = 0
        var offsetY: CGFloat
        
        private var _height: CGFloat {
            (height + offsetY) < minHeight ? minHeight : (height + offsetY)
        }
        
        private var progress: CGFloat {
            max(min(-offsetY / max(height - minHeight, 1), 1), 0)
        }
        
        private var profileImageScale: CGFloat { 1 - (progress * 0.7) }
        
        var body: some View {
            GeometryReader { _ in
                ZStack {
                    Rectangle().fill(Color.pink.linearGradient)
                    
                    VStack(spacing: 15) {
                        profileImageView
                        
                        Text("Mohamed Shimy")
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .scaleEffect(1 - (progress * 0.15))
                            .offset(y: -4.5 * progress)
                    }
                    .foregroundColor(.white)
                    .padding(.top, topPadding)
                    .padding(.bottom, 15)
                }
                .frame(height: _height, alignment: .bottom)
                .offset(y: -offsetY)
            }
            .frame(height: height)
        }
        
        private var profileImageView: some View {
            GeometryReader {
                let rect = $0.globalFrame
                
                let halfScaledHeight = (rect.height * 0.3) * 0.5
                let midY = rect.midY
                let bottomPadding: CGFloat = 15
                let resizedOffsetY = (midY - (minHeight - halfScaledHeight - bottomPadding))
                
                Image(systemName: "person")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .frame(rect.size)
                    .backgroundColor(.orange)
                    .clipShape(Circle())
                    .scaleEffect(profileImageScale, anchor: .leading)
                    .offset(x: -(rect .minX - 15) * progress, y: -resizedOffsetY * progress)
            }
            .frame(height * 0.5)
        }
        
    }
}
