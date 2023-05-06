//
//  HomeView.swift
//  Resizable Header
//
//  Created by Mohamed Shemy on 03/05/2023.
//

import SwiftUI
import SwiftUIKit

struct HomeView: View {
        
    @State private var offset: CGPoint = .zero
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let safeArea = proxy.safeAreaInsets
            let headerHeight = (size.height * 0.3) + safeArea.top
            
            IScrollView(.vertical, showsIndicators: false, offset: $offset) {
                VStack(spacing: 0) {
                    HeaderView(height: headerHeight,
                               minHeight: 65 + safeArea.top,
                               topPadding: safeArea.top,
                               offsetY: -offset.y)
                    .zIndex(1000)
                    
                    VStack(spacing: 15) {
                        ForEach(0...25, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .foregroundColor(.black.opacity(0.05))
                                .frame(height: 75)
                        }
                    }
                    .padding(15)
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}

extension Color {
  
    public var linearGradient: LinearGradient {
        LinearGradient(colors: [self.opacity(0.7), self],
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
