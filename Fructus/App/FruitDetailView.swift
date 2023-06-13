//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Leonardo Lazzari on 26/04/23.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: - PROPERTIES
    var fruit: Fruit
    @State private var isAnimatingImage: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // MARK: - Header
                    header
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // MARK: - Title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // MARK: - Headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // MARK: - Nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        // MARK: - Subheadline
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // MARK: - Description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // MARK: - Link
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    } //: VSTACK
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VSTACK
                .navigationBarTitleDisplayMode(.inline)
            } //: SCROLL VIEW
            .edgesIgnoringSafeArea(.top)
        } //: NAVIGATION STACK
    }
    
    // MARK: - HEADER DECLARATION
    var header: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxHeight: .infinity)
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 3, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
                .frame(height: 440)
        } //: ZSTACK
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
    
}

// MARK: - PREVIEW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
