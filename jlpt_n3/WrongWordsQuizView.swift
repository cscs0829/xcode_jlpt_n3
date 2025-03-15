//
//  WrongWordsQuizView.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI
import CoreData

struct WrongWordsQuizView: View {
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
            if currentWordIndex < filteredWords().count {
                Text(filteredWords()[currentWordIndex].kanji ?? "")
                Text(filteredWords()[currentWordIndex].meaning ?? "")
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
                Text("틀린 단어장 퀴즈 완료!")
            }
        }
        .onAppear {
            currentWordIndex = 0
        }
    }

    func checkAnswer() {
        if userAnswer == filteredWords()[currentWordIndex].hiragana {
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

    func filteredWords() -> [Word] {
        let wrongWords = UserDefaults.standard.array(forKey: "wrongWords") as? [String] ?? []
        let uniqueWrongWords = Array(Set(wrongWords)) // 중복 제거
        return words.filter { uniqueWrongWords.contains($0.kanji ?? "") }
    }
}
