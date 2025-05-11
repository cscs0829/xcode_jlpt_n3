# 📱 JLPT N3 단어 학습 앱

일본어 능력시험(JLPT) N3 수준의 단어를 쉽고 효율적으로 학습할 수 있도록 설계된 iOS 애플리케이션입니다.  
단어장, 객관식 퀴즈, 오답 노트 등 다양한 기능을 통해 체계적인 일본어 단어 학습을 지원합니다.

---

## 🧩 주요 기능

### 📘 단어장 기능
- JLPT N3 필수 단어 목록 제공 (JSON 기반 자동 로드)  
- 단어 추가(한자, 히라가나, 뜻 입력), 삭제, 상세 정보 확인 가능

<img src="https://github.com/user-attachments/assets/5245955f-ae34-4239-8f42-70e25a598eee" width="320" />
<img src="https://github.com/user-attachments/assets/a7f33c4d-9c07-4dd7-92a1-ee097370ccdb" width="320" />
<img src="https://github.com/user-attachments/assets/e51a353c-270c-4356-b6da-37e7bb8a2c8d" width="320" />

---

### 📝 단어 퀴즈
- 단어장의 히라가나 뜻 맞추기 퀴즈 제공  
- 정답 여부 즉시 피드백  
- 오답은 자동으로 틀린 단어장에 저장

<img src="https://github.com/user-attachments/assets/b029bcfa-e338-47b8-af22-15dd3f9b1745" width="320" />

---

### ❌ 틀린 단어장
- 퀴즈에서 틀린 단어만 자동 분류  
- 틀린 단어 개별 확인 및 삭제 가능

<img src="https://github.com/user-attachments/assets/f141092b-dc90-40af-86de-ddf92f49eea9" width="320" />

---

### 🔁 틀린 단어 퀴즈
- 틀린 단어장에 있는 단어들만 모아 다시 퀴즈  
- 반복 학습을 통해 약한 부분 보완

<img src="https://github.com/user-attachments/assets/0af00e71-7b55-4abb-ab3e-1501776ebd17" width="320" />

---

## 🛠️ 기술 스택

| 항목        | 사용 기술      |
|-------------|----------------|
| 언어         | Swift           |
| UI 프레임워크 | SwiftUI         |
| 데이터 저장   | Core Data       |
| 데이터 초기 로딩 | JSON 파싱      |

---

## ⚙️ 설치 및 실행 방법

1. **Xcode 설치**  
2. **프로젝트 클론 또는 다운로드**
3. `.xcodeproj` 파일을 **Xcode로 열기**
4. 시뮬레이터 또는 실제 디바이스에서 **Build & Run**

✅ 앱 최초 실행 시 `jlpt3.json` 에 포함된 단어가 Core Data에 자동으로 로드됩니다.

---

## 📂 앱 구성 화면별 설명

### 🔹 단어장 탭
- 등록된 단어 목록 및 상세 보기  
- '+' 버튼으로 단어 추가  
- 스와이프하여 단어 삭제  

<img src="https://github.com/user-attachments/assets/5648f466-fbb5-4490-886e-b6de78bd5642" width="320" />

---

### 🔹 틀린 단어장 탭
- 퀴즈에서 틀린 단어 목록 표시  
- 단어 선택 시 상세 보기  
- 스와이프하여 틀린 단어 목록에서 제거  
⚠️ Core Data에서 완전 삭제되지는 않습니다

<img src="https://github.com/user-attachments/assets/b167d9cb-f239-40ba-9c01-0d919c5fa633" width="320" />

---

### 🔹 단어장 퀴즈 탭
- 단어장의 모든 단어를 대상으로 퀴즈 진행  
- 정답 여부 즉시 확인  
- 오답은 자동 기록됨  
- 모든 문제 완료 시 종료 메시지 표시

<img src="https://github.com/user-attachments/assets/77339c96-cff3-4157-a41e-766c78a09e78" width="320" />

---

### 🔹 틀린 단어장 퀴즈 탭
- 오답 단어만을 대상으로 퀴즈 진행  
- 반복 학습을 통한 약점 보완 가능

<img src="https://github.com/user-attachments/assets/840393a0-d901-4c20-8fcb-ce8ea2c0bb8f" width="320" />

---

## 📌 마무리

이 앱은 단순한 단어 암기를 넘어  
**오답 복습 → 반복 학습 → 점진적 마스터** 흐름을 설계하여  
JLPT N3 합격을 목표로 한 학습자에게 최적화된 도구입니다.
