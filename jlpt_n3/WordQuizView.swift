//
//  QuizView.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI
import CoreData

struct WordQuizView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Word.kanji, ascending: true)], animation: .default)
    private var words: FetchedResults<Word>

    @State private var currentWordIndex = 0
    @State private var userAnswer = ""
    @State private var isCorrect = false
    @State private var showTryAgain = false
    @State private var showNextButton = false
    @State private var showWrongWordsButton = false

    var body: some View {
        VStack {
            if currentWordIndex < words.count {
                Text(words[currentWordIndex].kanji ?? "")
                Text(words[currentWordIndex].meaning ?? "")
                TextField("히라가나", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("확인") {
                    checkAnswer()
                }
                if isCorrect {
                    Text("정답!")
                        .foregroundColor(.green)
                }
                if showTryAgain {
                    Text("틀렸습니다. 다시 입력해주세요.")
                        .foregroundColor(.red)
                    if showNextButton {
                        Button("다음") {
                            nextWord()
                        }
                    }
                }
            } else {
                Text("단어장 퀴즈 완료!")
            }
        }
        .onAppear {
            currentWordIndex = 0
        }
    }

    func checkAnswer() {
        if userAnswer == words[currentWordIndex].hiragana {
            isCorrect = true
            showTryAgain = false
            currentWordIndex += 1
            userAnswer = ""
            showNextButton = false
            showWrongWordsButton = false
        } else {
            isCorrect = false
            showTryAgain = true
            showNextButton = true
            showWrongWordsButton = true
            var wrongWords = UserDefaults.standard.array(forKey: "wrongWords") as? [String] ?? []
            wrongWords.append(words[currentWordIndex].kanji ?? "")
            UserDefaults.standard.set(wrongWords, forKey: "wrongWords")
        }
    }

    func nextWord() {
        currentWordIndex += 1
        userAnswer = ""
        isCorrect = false
        showTryAgain = false
        showNextButton = false
        showWrongWordsButton = false
    }
}
