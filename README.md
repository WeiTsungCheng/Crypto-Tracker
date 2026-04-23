# Crypto Tracker

A SwiftUI-based iOS app that displays cryptocurrency market data using the CoinGecko public API.  
Users can browse coins, view details, mark favorites, and interact with a responsive, state-driven UI.

Prices are displayed in GBP.

---

## 🚀 Features

- 📊 Real-time cryptocurrency list
- 🔍 Search and filtering
- ↕️ Sorting (market cap, price, name)
- ⭐ Favorite coins (persisted with UserDefaults)
- 🔄 Pull-to-refresh
- ⚠️ Loading, error, and empty states
- 📱 Navigation to coin detail screen

---

## 🧱 Architecture Evolution

This project demonstrates an evolution of state management approaches:

### 🔹 Initial Version — TCA-style Architecture

The app was originally implemented using a reducer-based architecture inspired by  
**The Composable Architecture (TCA)**.

| Component | Role |
|----------|------|
| State | `AppState` — UI state (coins, loading, errors, favorites) |
| Action | `AppAction` — all possible user/system events |
| Reducer | `appReducer` — pure state transitions |
| Store | `Store` — holds state and handles side effects |

#### Data flow was strictly unidirectional:
View → Action → Reducer → State → View

This approach provided strong structure and predictability.

---


### 🔹 Current Version — MVVM + SwiftUI Data Flow

The project was later refactored into **MVVM architecture** to simplify the data flow and reduce boilerplate.

#### Structure

- **View**
  - Renders UI
  - Binds to state
  - Triggers user actions

- **ViewModel**
  - Manages UI state
  - Handles business logic
  - Communicates with services

- **Service Layer**
  - Handles networking (CoinGecko API)
  - Handles persistence (UserDefaults)

#### Data Flow
View → ViewModel → Service → ViewModel → View

---

### 🔹 iOS 17 Upgrade — Observation Framework

The MVVM implementation adopts the **Observation framework (iOS 17+)**:

- `@Observable` replaces `ObservableObject`
- `@State` replaces `@StateObject`
- `@Bindable` enables direct bindings in subviews

This results in:

- Less boilerplate (`@Published` removed)
- Fine-grained UI updates
- Cleaner SwiftUI integration

---

## 🧩 Key Implementation Details

### State Management

- State-driven UI (loading / success / error)
- Centralized state in ViewModel
- Derived state (`displayCoins`) for filtering & sorting

---

### Search & Sorting

- Search by name and symbol
- Sorting options:
  - Market Cap
  - Price (High → Low / Low → High)
  - Name (localized, case-insensitive)
- Implemented using computed properties in ViewModel

---

### Persistence

- Favorites stored using `UserDefaults`
- Managed via a dedicated `PersistenceService`

---

### Networking

- `APIService` abstracts CoinGecko API calls
- Uses `async/await`
- Error handling via custom `NetworkError`

---

## 📁 Project Structure

- Models/        → Coin, DTO models
- Services/      → APIService, PersistenceService
- ViewModels/    → CoinListViewModel
- Views/         → Screens and reusable UI components
- Components/    → Loading, Error, Empty states

---

## 🧪 Testing & Preview

- Dependency Injection via `APIServiceProtocol`
- `MockAPIService` for previews and testing
- Enables UI development without network dependency

---

## 📌 Why the Refactor?

The transition from a TCA-style architecture to MVVM was motivated by:

- Reducing complexity for the app’s scale
- Improving readability and maintainability
- Simplifying SwiftUI integration
- Keeping a clear separation of concerns

---

## 🛠 Tech Stack

- SwiftUI
- MVVM
- Observation Framework (`@Observable`, `@Bindable`)
- Async/Await
- REST API (CoinGecko)

---

## 🔗 API

- CoinGecko Public API  
  https://www.coingecko.com/en/api
