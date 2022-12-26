//
//  CircularImageView.swift
//  WidgetHero
//
//  Created by Doğukan Aydemir on 30.11.2022.
//

import SwiftUI

struct CircularImageView: View {
    
    var image : Image

    var body: some View {
        
        image.resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(Circle())
        .overlay(Circle()
            .stroke(Color
                .black, lineWidth: 7))
        .shadow(radius: 25)
        
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("batman"))
    }
}
