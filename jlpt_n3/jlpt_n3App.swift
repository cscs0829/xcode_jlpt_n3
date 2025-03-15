//
//  jlpt_n3App.swift
//  jlpt_n3
//
//  Created by 박창선 on 3/15/25.
//

import SwiftUI

@main
struct JLPTWordAppApp: App {
    let persistenceController = CoreDataManager.shared.container.viewContext

    init() {
        CoreDataManager.shared.loadJSONData() // 앱 시작 시 JSON 데이터 로드
    }

    var body: some Scene {
        WindowGroup {
            TabView {
                WordListView()
                    .environment(\.managedObjectContext, persistenceController)
                    .tabItem {
                        Label("단어장", systemImage: "list.dash")
                    }
                WrongWordsView()
                    .environment(\.managedObjectContext, persistenceController)
                    .tabItem {
                        Label("틀린 단어장", systemImage: "xmark.octagon")
                    }
                WordQuizView()
                    .environment(\.managedObjectContext, persistenceController)
                    .tabItem {
                        Label("단어장 퀴즈", systemImage: "book")
                    }
                WrongWordsQuizView()
                    .environment(\.managedObjectContext, persistenceController)
                    .tabItem {
                        Label("틀린 단어장 퀴즈", systemImage: "xmark.octagon.fill")
                    }
            }
        }
    }
}
