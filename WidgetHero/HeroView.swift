//
//  HeroView.swift
//  WidgetHero
//
//  Created by Doğukan Aydemir on 30.11.2022.
//

import SwiftUI

struct HeroView: View {
    
    var hero : Superhero
    
    var body: some View {
        
        HStack {
            CircularImageView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
                Spacer()
            VStack {
                Text(hero.name)
                    .font(.largeTitle)
                    .bold()
                Text(hero.realName)
                    .bold()
            }.padding()
            Spacer()
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: batman)
    }
}
