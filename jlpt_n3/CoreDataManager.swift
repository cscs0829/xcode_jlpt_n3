//
//  CoreDataManager.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import CoreData
import SwiftUI

class CoreDataManager {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    private var dataLoaded = false

    private init() {
            container = NSPersistentContainer(name: "jlpt_n3")
            container.loadPersistentStores { (description, error) in
                if let error = error {
                    fatalError("Core Data store failed to load: \(error.localizedDescription)")
                }
            }
        }

    func save() {
            let context = container.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    print("Failed to save Core Data context: \(error.localizedDescription)")
                }
            }
        }

    func addWord(kanji: String, hiragana: String, meaning: String) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "kanji == %@", kanji)

        do {
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
                let newWord = Word(context: context)
                newWord.kanji = kanji
                newWord.hiragana = hiragana
                newWord.meaning = meaning
                save()
            } else {
                print("Word '\(kanji)' already exists.")
            }
        } catch {
            print("Failed to check for existing word: \(error.localizedDescription)")
        }
    }
    
    func loadJSONData() {
        guard let url = Bundle.main.url(forResource: "jlpt3", withExtension: "json") else {
            print("JSON file not found.")
            return
        }

        do {
            let data = try Data(contentsOf: url)

            // 디버깅: JSON 데이터를 문자열로 변환하여 출력
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Loaded JSON String: \(jsonString)")
            }

            let words = try JSONDecoder().decode([WordData].self, from: data)

            words.forEach { wordData in
                addWord(kanji: wordData.kanji, hiragana: wordData.hiragana, meaning: wordData.meaning)
            }
        } catch {
            print("Error loading JSON data: \(error.localizedDescription)")
        }
    }
}

struct WordData: Codable {
    let kanji: String
    let hiragana: String
    let meaning: String
}
