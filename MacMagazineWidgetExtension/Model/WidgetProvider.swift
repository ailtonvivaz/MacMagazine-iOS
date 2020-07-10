//
//  WidgetProvider.swift
//  MacMagazineWidgetExtensionExtension
//
//  Created by Ailton Vieira Pinto Filho on 07/07/20.
//  Copyright © 2020 MacMagazine. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct PostsProvider: IntentTimelineProvider {
    public func snapshot(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (PostsEntry) -> ()) {
        let entry = PostsEntry(date: Date(), configuration: configuration, post: XMLPost())
        completion(entry)
    }

    public func timeline(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (Timeline<PostsEntry>) -> ()) {
        
        API().getPosts { post in
            guard let post = post else {
                return
            }
            
            let currentDate = Date()
            let refreshDate = Calendar.current.date(byAdding: .second, value: 10, to: currentDate)!
            
            let entry = PostsEntry(date: currentDate, configuration: configuration, post: post)

            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
        
    }
}
