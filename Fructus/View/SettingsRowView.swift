//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Leonardo Lazzari on 26/04/23.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack(alignment: .center, spacing: 10) {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if let content = content {
                    Text(content)
                } else if let linkLabel = linkLabel, let linkDestination = linkDestination {
                    Link(destination: URL(string: "https://\(linkDestination)")!) {
                        Group {
                            Text(linkLabel)
                            Image(systemName: "arrow.up.right.square")
                                .foregroundColor(.pink)
                        }
                    }
                    
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Leonardo Lazzari")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            
            SettingsRowView(name: "Website", linkLabel: "GitHub", linkDestination: "github.com/lerpof")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
