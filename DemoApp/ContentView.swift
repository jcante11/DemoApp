//
//  ContentView.swift
//  DemoApp
//
//  Created by Juan Cante Jr. on 5/4/24.
//

import SwiftUI

class QuizManager: ObservableObject {
    var mockQuestions = [
    Question(title: "Question 1", answer: "a", choices: ["a", "b", "c", "d"]),
    Question(title: "Question 2", answer: "a", choices: ["a", "b", "c", "d"]),
    Question(title: "Question 3", answer: "a", choices: ["a", "b", "c", "d"])]
}

struct ContentView: View {
    @StateObject var manager = QuizManager()
    
    var body: some View {
        TabView{
            ForEach(manager.mockQuestions, id: \.id) { question in QuestionView(question: question)}
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
