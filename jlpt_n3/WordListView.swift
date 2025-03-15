//
//  WordListView.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI
import CoreData

struct WordListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Word.kanji, ascending: true)], animation: .default)
    private var words: FetchedResults<Word>

    @State private var showingAddWord = false

    var body: some View {
        NavigationView {
            List {
                ForEach(words) { word in
                    NavigationLink {
                        VStack(alignment: .leading) {
                            Text("한자: \(word.kanji ?? "")")
                            Text("히라가나: \(word.hiragana ?? "")")
                            Text("뜻: \(word.meaning ?? "")")
                        }
                    } label: {
                        Text(word.kanji ?? "")
                    }
                }
                .onDelete(perform: deleteWords)
            }
            .navigationTitle("JLPT N3 단어장")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddWord = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddWord) {
                AddWordView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }

    private func deleteWords(offsets: IndexSet) {
        withAnimation {
            offsets.map { words[$0] }.forEach(viewContext.delete)
            CoreDataManager.shared.save()
        }
    }
}
