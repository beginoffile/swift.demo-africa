//
//  VideoListItem.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 03/04/24.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    let video: Video
    //MARK: - BODY
    
    var body: some View {
        HStack(spacing:10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZSTACK
            VStack(alignment: .leading, spacing:10, content: {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            })
        } //: HSTACK
    }
}

#Preview {
    @State var videos : [Video] = Bundle.main.decode(file: "videos.json")
    return VideoListItemView(video: videos[0])
}
