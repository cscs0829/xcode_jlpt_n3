//
//  AddWordView.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI

struct AddWordView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var kanji = ""
    @State private var hiragana = ""
    @State private var meaning = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("한자", text: $kanji)
                TextField("히라가나", text: $hiragana)
                TextField("뜻", text: $meaning)
                Button("저장") {
                    CoreDataManager.shared.addWord(kanji: kanji, hiragana: hiragana, meaning: meaning)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("단어 추가")
        }
    }
}
