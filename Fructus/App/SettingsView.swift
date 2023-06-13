//
//  SettingsView.swift
//  Fructus
//
//  Created by Leonardo Lazzari on 26/04/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding = false

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - Section 1
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    } label: {
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    } //: GROUP BOX SECTION 1

                    // MARK: - Section 2
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            Text("Restart".uppercased())
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    } label: {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    } //: GROUP BOX SECTION 2
                    
                    // MARK: - Section 3
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "Leonardo Lazzari")
                        SettingsRowView(name: "Designer", content: "Leonardo Lazzari")
                        SettingsRowView(name: "Compatibility", content: "iOS 16+")
                        SettingsRowView(name: "Website", linkLabel: "GitHub", linkDestination: "github.com/lerpof")
                        SettingsRowView(name: "SwiftUI", content: "3.0")
                    } label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    } //: GROUP BOX SECTION 3
                } //: VSTACK
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        } //: BUTTON

                    }
                } //: TOOLBAR
                .padding()
            } //: SCROLL VIEW
        } //: NAVIGATION STACK
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
