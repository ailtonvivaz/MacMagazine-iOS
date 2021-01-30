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
                    VStack {
                        PostCell(post: content[0], style: .row)
                        PostCell(post: content[1], style: .row)
                    }.padding(8)
                case .systemLarge:
                    GeometryReader { geo in
                        VStack(spacing: 0) {
                            PostCell(post: content[0], style: .cover)
                                .frame(height: 0.45 * geo.size.height)
                                .padding([.top, .horizontal], 8)
                            VStack {
                                PostCell(post: content[1], style: .row)
                                PostCell(post: content[2], style: .row)
                            }.padding(8)
                        }
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
