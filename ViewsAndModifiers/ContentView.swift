//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mehdi on 3/8/2024.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 15))
    }
}

extension View {
    func titleStyle () -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    let title: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content

            Text(title)
                .font(.headline.weight(.semibold))
                .foregroundStyle(.white)
                .padding(5)
                .background(.secondary)
        }
    }
}

extension View {
    func watermarkStyle (with text: String) -> some View {
        modifier(Watermark(title: text))
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .titleStyle()
            .watermarkStyle(with: "test")
    }
}

#Preview {
    ContentView()
}
