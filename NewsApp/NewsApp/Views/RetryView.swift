//
//  RetryView.swift
//  NewsApp
//
//  Created by A-Avramenko on 12.07.2024.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8){
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try again")
            }
        }
    }
}

#Preview {
    RetryView(text: "An error occured") {
        
    }
}
