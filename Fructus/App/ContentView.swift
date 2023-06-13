//
//  ContentView.swift
//  Fructus
//
//  Created by Leonardo Lazzari on 17/04/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isShowingSettings = false
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink {
                        FruitDetailView(fruit: fruit)
                    } label: {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                }
            } //: TOOLBAR
        } //: NAVIGATION STACK
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
