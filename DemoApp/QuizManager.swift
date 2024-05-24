//
//  QuizManager.swift
//  DemoApp
//
//  Created by Juan Cante Jr. on 5/24/24.
//

import Foundation
import Supabase

class QuizManager: ObservableObject {
    
    @Published var mockQuestions = [
        Question(title: "Question 1", answer: "a", options: ["a", "b", "c", "d"]),
        Question(title: "Question 2", answer: "a", options: ["a", "b", "c", "d"]),
        Question(title: "Question 3", answer: "a", options: ["a", "b", "c", "d"])]
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://dezqgmvdoztrmyjdiihv.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRlenFnbXZkb3p0cm15amRpaWh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY1OTA1MDksImV4cCI6MjAzMjE2NjUwOX0.wn1WN3FcoAl1ZX8GIg2Kf-rx_TO3T8aTC9CQGQ-uJRs")
    
    func canSubmitQuiz() -> Bool {
        return mockQuestions.filter({ $0.selection == nil}).isEmpty
    }
    
    func gradeQuiz() -> String {
        var correct: CGFloat = 0
        for question in mockQuestions {
            if question.answer == question.selection {
                correct += 1
            }
        }
        return "\((correct/CGFloat(mockQuestions.count)) * 100) %"
    }
}
