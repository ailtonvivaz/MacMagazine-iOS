//
//  MacMagazineWidgetExtension.swift
//  MacMagazineWidgetExtension
//
//  Created by Ailton Vieira Pinto Filho on 29/06/20.
//  Copyright © 2020 MacMagazine. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct MacMagazineWidgetExtension: Widget {
    private let kind: String = "MacMagazineWidgetExtension"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: PostsProvider(), placeholder: PlaceholderView()) { entry in
            MacMagazineWidgetExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
