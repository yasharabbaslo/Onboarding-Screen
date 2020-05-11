//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Yashar Abbaslo on 2/21/1399 AP.
//  Copyright © 1399 Yashar Abbaslo. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
//    UIHostingControllers are used for wrapping SwiftUI views in order to use them within the UIKit framework.
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "meditating")),
        UIHostingController(rootView: Subview(imageString: "skydiving")),
        UIHostingController(rootView: Subview(imageString: "sitting"))
    ]
    
    var titles = ["Take some time out", "Conquer personal hindrances", "Create a peaceful mind"]
    var captions =  ["Take your time out and bring awareness into your everyday life", "Meditating helps you dealing with anxiety and other psychic problems", "Regular medidation sessions creates a peaceful inner mind"]
    
    @State var currentPageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            PageViewController(viewControllers: subviews, currentPageIndex: $currentPageIndex)
                .frame(height: 600)
            
            Group {
                Text(titles[currentPageIndex])
                    .font(.title)
                
                Text(captions[currentPageIndex])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .lineLimit(nil)
            }
                .padding()
            
            HStack {
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                
                Spacer()
                
                Button(action: {
                    if self.currentPageIndex+1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContent()
                }
            }
                .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct ButtonContent: View {
    var body: some View {
        Image(systemName: "arrow.right")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color.orange)
            .cornerRadius(30)
    }
}
