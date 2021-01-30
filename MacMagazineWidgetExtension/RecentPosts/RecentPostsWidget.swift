//
//  RecentPostsWidget.swift
//  MacMagazineWidgetExtensionExtension
//
//  Created by Ailton Vieira Pinto Filho on 16/01/21.
//  Copyright © 2021 MacMagazine. All rights reserved.
//

import SwiftUI
import WidgetKit

struct RecentPostsWidget: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: RecentPostsEntry

    var content: [PostData] { entry.posts }

    var body: some View {
        Group {
            if content.isEmpty {
                Text("Nenhum conteúdo")
                    .font(.headline)
                    .padding()
            } else {
                switch widgetFamily {
                case .systemSmall:
                    PostCell(post: content[0], style: .cover)
                case .systemMedium:
                    VStack(spacing: 0) {
                        PostCell(post: content[0], style: .cover)
                        PostCell(post: content[1], style: .cover)
                    }
                case .systemLarge:
                    VStack(spacing: 0) {
                        PostCell(post: content[0], style: .cover)
                        PostCell(post: content[1], style: .cover)
                        PostCell(post: content[2], style: .cover)
                    }
                @unknown default:
                    Text("other size")
                }
            }
        }.background(Color(.secondarySystemBackground))
    }
}

struct RecentPostsWidget_Previews: PreviewProvider {
    static var previews: some View {
        RecentPostsWidget(entry: RecentPostsEntry(date: Date(), posts: [.placeholder, .placeholder, .placeholder, .placeholder]))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.sizeCategory, .extraLarge)
    }
}
