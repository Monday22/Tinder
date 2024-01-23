//
//  InboxRowView.swift
//  Tinder
//
//  Created by Stephan Dowless on 1/12/24.
//

import SwiftUI

struct InboxRowView: View {
    let thread: Thread
            
    var chatPartner: User? {
        return thread.chatPartner
    }
    
    var message: Message {
        return thread.lastMessage
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: chatPartner, size: .medium)
                        
            VStack(alignment: .leading, spacing: 4) {
                Text(chatPartner?.fullname ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("\(message.isFromCurrentUser ? "You: \(message.text)" : message.text)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing)
            }
        }
        .overlay(alignment: .topTrailing) {
            HStack {
                Text(thread.lastUpdated.dateValue().timestampString())
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(maxHeight: 72)
    }
}

#Preview {
    InboxRowView(thread: DeveloperPreview.threads[0])
}