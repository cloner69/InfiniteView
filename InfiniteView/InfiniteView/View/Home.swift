//
//  Home.swift
//  InfiniteView
//
//  Created by Adrian Suryo Abiyoga on 30/01/25.
//

import SwiftUI

struct Home: View {
    /// Sample Items
    @State private var items: [Item] = [.red, .blue, .green, .yellow, .cyan].compactMap { return .init(color: $0) }
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                GeometryReader {
                    let size = $0.size
                    
                    LoopingScrollView(width: 150, spacing: 10, items: items) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item.color.gradient)
                            .overlay {
                                if let index = items.firstIndex(where: { $0.id == item.id }) {
                                    Text("\(index)")
                                        .font(.largeTitle.bold())
                                }
                            }
                    }
                    .contentMargins(.horizontal, 15, for: .scrollContent)
                }
                .frame(height: 150)
            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
