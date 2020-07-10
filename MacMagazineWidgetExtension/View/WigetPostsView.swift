//
//  WigetPostsView.swift
//  MacMagazineWidgetExtensionExtension
//
//  Created by Ailton Vieira Pinto Filho on 07/07/20.
//  Copyright © 2020 MacMagazine. All rights reserved.
//

import SwiftUI

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct MacMagazineWidgetExtensionEntryView : View {
    var entry: PostsProvider.Entry

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!, placeholder: Rectangle().foregroundColor(.red))
            VStack {
                Spacer()
                HStack {
                    Text(entry.post.title)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    Spacer(minLength: 0)
                }
                Group {
                    HStack {
                        Text("POR ") + Text("LUIZ GUSTAVO RIBEIRO").bold()
                        Spacer()
                        Text("💬 5")
                    }.font(.system(size: 8))
                }.padding(.top, 5)
            }.padding()
        }
    }
}
