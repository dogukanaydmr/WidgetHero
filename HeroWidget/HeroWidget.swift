//
//  HeroWidget.swift
//  HeroWidget
//
//  Created by Doğukan Aydemir on 30.11.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.dogukanaydmr.WidgetHero"))
    var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Superhero(name: "Batman", realName: "Bruce Wayne", image: "batman"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
            let decoder = JSONDecoder()
            if let hero = try? decoder.decode(Superhero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
            let decoder = JSONDecoder()
            if let hero = try? decoder.decode(Superhero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero : Superhero
}

struct HeroWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
    }
}

@main
struct HeroWidget: Widget {
    let kind: String = "HeroWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HeroWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

