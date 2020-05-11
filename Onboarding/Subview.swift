//
//  Subview.swift
//  Onboarding
//
//  Created by Yashar Abbaslo on 2/21/1399 AP.
//  Copyright © 1399 Yashar Abbaslo. All rights reserved.
//

import SwiftUI

struct Subview: View {
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "sitting")
    }
}
