//
//  ContentView.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Word.kanji, ascending: true)],
        animation: .default)
    private var words: FetchedResults<Word>

    var body: some View {
        NavigationView {
            List {
                ForEach(words) { word in
                    NavigationLink {
                        Text("한자: \(word.kanji ?? "")")
                        Text("히라가나: \(word.hiragana ?? "")")
                        Text("뜻: \(word.meaning ?? "")")
                    } label: {
                        Text(word.kanji ?? "")
                    }
                }
            }
            .navigationTitle("JLPT N3 단어장")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newWord = Word(context: viewContext)
            newWord.kanji = "新しい漢字"
            newWord.hiragana = "あたらしいひらがな"
            newWord.meaning = "새로운 뜻"

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
