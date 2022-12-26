//
//  ContentView.swift
//  WidgetHero
//
//  Created by Doğukan Aydemir on 30.11.2022.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.dogukanaydmr.WidgetHero"))
    var heroData : Data = Data()
    
    var superheroArray = [batman, superman, ironman]
    
    var body: some View {
        VStack {
            ForEach(superheroArray) { hero in
                HeroView(hero: hero).onTapGesture {
                    saveToDefaults(hero: hero)
                }
            }
        }
        .padding()
    }
    
    func saveToDefaults(hero : Superhero) {
        
            let encoder = JSONEncoder()
            if let dataHero = try? encoder.encode(hero) {
            self.heroData = dataHero
            WidgetCenter.shared.reloadTimelines(ofKind: "HeroWidget")
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
