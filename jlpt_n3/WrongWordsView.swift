//
//  WrongWordsView.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI
import CoreData

struct WrongWordsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Word.kanji, ascending: true)], animation: .default)
    private var words: FetchedResults<Word>
    
    @State private var wrongWords: [String] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredWords(), id: \.self) { word in
                    VStack(alignment: .leading) {
                        Text("한자: \(word.kanji ?? "")")
                        Text("히라가나: \(word.hiragana ?? "")")
                        Text("뜻: \(word.meaning ?? "")")
                    }
                }
                .onDelete(perform: deleteWords)
            }
            .navigationTitle("틀린 단어장")
        }
        .onAppear {
            loadWrongWords()
        }
    }
    
    private func loadWrongWords() {
        if let storedWrongWords = UserDefaults.standard.array(forKey: "wrongWords") as? [String] {
            let uniqueWords = Array(Set(storedWrongWords)) // ✅ 중복 제거
            UserDefaults.standard.set(uniqueWords, forKey: "wrongWords")
            wrongWords = uniqueWords
        }
    }

    private func filteredWords() -> [Word] {
        return words.filter { wrongWords.contains($0.kanji ?? "") }
    }
    
    private func deleteWords(at offsets: IndexSet) {
        offsets.sorted(by: >).forEach { index in
            let word = filteredWords()[index]
            if let kanji = word.kanji, let indexToRemove = wrongWords.firstIndex(of: kanji) {
                wrongWords.remove(at: indexToRemove)
            }
        }
        UserDefaults.standard.set(wrongWords, forKey: "wrongWords")
    }
}
