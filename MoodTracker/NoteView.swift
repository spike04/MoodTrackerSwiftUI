//
//  NoteView.swift
//  MoodTracker
//
//  Created by Rubin Bajracharya on 14/08/2024.
//

import SwiftUI

struct NoteView: View {
    @State var open = false
    @State var text = ""
    @Binding var scrollToBottom: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Note Mood").font(.title2.bold())
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: open ? .topLeading: .center)
            
            if open {
                TextEditor(text: $text).padding(10)
                    .scrollContentBackground(.hidden)
                    .frame(height: 100)
                    .background(.gray.opacity(0.3), in: .rect(cornerRadius: 8))
                    .padding()
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                withAnimation {
                    open = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .padding(22).opacity(open ? 1: 0)
                    .animation(.none, value: open)
                    .id("NoteEditor")
            }
            .tint(.white)
        }
        .frame(height: open ? 190: 55)
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 12))
        .clipped()
        .onTapGesture {
            withAnimation {
                if !open {
                    open.toggle()
                    scrollToBottom .toggle()
                }
            }
        }
    }
}

#Preview {
    NoteView(scrollToBottom: .constant(false))
}
