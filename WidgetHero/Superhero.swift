//
//  Superhero.swift
//  WidgetHero
//
//  Created by Doğukan Aydemir on 30.11.2022.
//

import Foundation

struct Superhero : Identifiable, Codable {
    
    var name : String
    var realName : String
    var image : String
    var id: String{image}
}

let superman = Superhero(name: "Superman", realName: "Clark Kent", image: "superman")
let batman = Superhero(name: "Batman", realName: "Bruce Wayne", image: "batman")
let ironman = Superhero(name: "Iron Man", realName: "Tony Stark", image: "ironman")
