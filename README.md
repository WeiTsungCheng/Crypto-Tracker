# Crypto Tracker

A simple **iOS** app built with **SwiftUI** that shows cryptocurrency market data. You can browse coins, open details, mark favorites, and pull to refresh. Prices are shown in **GBP** via the [CoinGecko](https://www.coingecko.com/) public API.

## Features

- List of coins (top results from the API, capped in the app)
- Loading and error states with retry
- Favorite coins, saved with **UserDefaults**
- Navigation to a detail screen per coin

## Architecture: The Composable Architecture (TCA)

The app follows **The Composable Architecture (TCA)** ideas in a straightforward way:

| Piece        | Role |
| ------------ | ---- |
| **State**    | `AppState` — what the UI reads (coins, loading, errors, favorites) |
| **Action**   | `AppAction` — everything that can happen (fetch, success, failure, toggle favorite) |
| **Reducer**  | `appReducer` — pure updates: given an action, it returns the next state |
| **Store**    | `Store` — holds state, sends actions, and runs side effects (network, saving favorites) |

Data flows in one direction: the UI sends **actions** → the **reducer** updates **state** → SwiftUI redraws. That keeps logic easy to follow and test.

### Project layout (short)

- `State/` — `AppState`, `AppAction`, `AppReducer`
- `Store/` — `Store`
- `Views/` — list row and detail
- `Services/` — `APIService` (CoinGecko)
- `Models/` — `Coin`
- `Storage/` — `PersistenceService` (favorites)
