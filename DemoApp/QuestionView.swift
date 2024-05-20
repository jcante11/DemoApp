//
//  QuestionView.swift
//  DemoApp
//
//  Created by Juan Cante Jr. on 5/20/24.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let title: String
    let answer: String
    let choices: [String]
}

struct QuestionView: View {
    @State var question : Question
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(question.title)
            
            ForEach(question.choices, id:\.self){
                choice in Text(choice)
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 330, height: 550, alignment: .leading)
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(20)
        .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 15)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question(title: "Question 1", answer: "a", choices: ["a", "b", "c", "d"]))
    }
}
