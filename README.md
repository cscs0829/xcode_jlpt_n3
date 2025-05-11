# JLPT N3 단어 학습 앱

## 설명

이 프로젝트는 JLPT N3 수준의 일본어 단어를 효과적으로 학습하고 관리할 수 있도록 돕는 iOS 애플리케이션입니다. 사용자들은 단어장을 통해 새로운 단어를 익히고, 퀴즈 기능을 통해 학습 성과를 확인할 수 있습니다. 또한, 틀린 단어들을 별도로 모아 복습할 수 있는 기능도 제공합니다.

## 주요 기능

* **단어장 관리:**
    * JLPT N3 필수 단어 목록 제공 (JSON 파일 기반)
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 26 23](https://github.com/user-attachments/assets/5245955f-ae34-4239-8f42-70e25a598eee)
    * 새로운 단어 추가 기능 (한자, 히라가나, 뜻 입력)
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 26 13](https://github.com/user-attachments/assets/a7f33c4d-9c07-4dd7-92a1-ee097370ccdb)
    * 등록된 단어 목록 조회 및 개별 단어 상세 정보 확인
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 26 56](https://github.com/user-attachments/assets/e51a353c-270c-4356-b6da-37e7bb8a2c8d)
    * 단어 삭제 기능
* **단어 퀴즈:**
    * 등록된 전체 단어를 대상으로 히라가나 뜻 맞추기 퀴즈 진행
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 27 22](https://github.com/user-attachments/assets/b029bcfa-e338-47b8-af22-15dd3f9b1745)
    * 퀴즈 정답 여부 즉시 확인
    * 틀린 단어는 자동으로 '틀린 단어장'에 추가
* **틀린 단어장:**
    * 퀴즈에서 틀린 단어들만 모아서 보여주는 기능
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 27 42](https://github.com/user-attachments/assets/f141092b-dc90-40af-86de-ddf92f49eea9)
    * 틀린 단어 목록에서 특정 단어 삭제 기능
* **틀린 단어 퀴즈:**
    * 틀린 단어장에 등록된 단어들만을 대상으로 다시 퀴즈를 풀어보는 기능
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 28 09](https://github.com/user-attachments/assets/0af00e71-7b55-4abb-ab3e-1501776ebd17)

## 기술 스택

* **언어:** Swift
* **UI 프레임워크:** SwiftUI
* **데이터 관리:** Core Data
* **데이터 로딩:** JSON 파일 파싱

## 설치 및 실행 방법

1.  Xcode를 설치합니다.
2.  이 프로젝트를 클론하거나 다운로드합니다.
3.  Xcode에서 `.xcodeproj` 파일을 엽니다.
4.  원하는 시뮬레이터 또는 실제 iOS 기기를 선택하고 실행(Build & Run)합니다.
    * 앱 실행 시 `jlpt3.json` 파일에 포함된 단어들이 Core Data에 자동으로 로드됩니다.

## 사용 방법

앱을 실행하면 다음과 같은 탭 메뉴를 통해 주요 기능들을 이용할 수 있습니다.

* **단어장 탭:**
    * 등록된 JLPT N3 단어 목록을 확인할 수 있습니다.
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 23 37](https://github.com/user-attachments/assets/5648f466-fbb5-4490-886e-b6de78bd5642)
    * 각 단어를 선택하면 한자, 히라가나, 뜻 상세 정보를 볼 수 있습니다.
    * 오른쪽 상단의 '+' 버튼을 눌러 새로운 단어를 추가할 수 있습니다. (한자, 히라가나, 뜻 입력)
    * 목록에서 단어를 스와이프하여 삭제할 수 있습니다.
* **틀린 단어장 탭:**
    * 단어장 퀴즈에서 틀렸던 단어들의 목록을 보여줍니다.
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 27 42](https://github.com/user-attachments/assets/b167d9cb-f239-40ba-9c01-0d919c5fa633)
    * 각 단어를 선택하면 상세 정보를 확인할 수 있습니다.
    * 목록에서 단어를 스와이프하여 '틀린 단어장'에서 제거할 수 있습니다. (이 작업은 Core Data에서 단어를 완전히 삭제하는 것은 아닙니다.)
* **단어장 퀴즈 탭:**
    * 단어장 퀴즈에서 문제가 출제됩니다.
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 29 34](https://github.com/user-attachments/assets/77339c96-cff3-4157-a41e-766c78a09e78)
    * 화면에 표시된 단어의 한자와 뜻을 보고 히라가나를 입력합니다.
    * '확인' 버튼을 누르면 정답 여부가 표시됩니다.
    * 틀린 경우, 해당 단어는 '틀린 단어장'에 기록됩니다.
    * 모든 단어에 대한 퀴즈가 끝나면 완료 메시지가 표시됩니다.
* **틀린 단어장 퀴즈 탭:**
    * '틀린 단어장'에 있는 단어들만을 대상으로 퀴즈를 진행합니다.
        * ![Simulator Screenshot - iPhone 16 Pro - 2025-05-11 at 16 30 52](https://github.com/user-attachments/assets/840393a0-d901-4c20-8fcb-ce8ea2c0bb8f)
    * 사용 방법은 '단어장 퀴즈'와 동일합니다.
