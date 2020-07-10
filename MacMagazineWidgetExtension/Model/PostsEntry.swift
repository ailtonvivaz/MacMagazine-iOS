//
//  PostsEntry.swift
//  MacMagazineWidgetExtensionExtension
//
//  Created by Ailton Vieira Pinto Filho on 07/07/20.
//  Copyright © 2020 MacMagazine. All rights reserved.
//

import Foundation
import WidgetKit

struct PostsEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let post: XMLPost
}
