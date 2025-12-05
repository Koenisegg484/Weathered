# 🌦 Weathered

Weathered is a modern Flutter application that delivers real-time weather updates with a clean, scalable architecture. Built as a practice project, it demonstrates how to structure apps using **Clean Architecture**, manage state with **BLoC**, and perform **HTTP API calls** for fetching live data.

---

## ✨ Features

- **Current Weather Data**: Fetches real-time weather information from a public API.
- **City Search**: Allows users to search for weather conditions in any city worldwide.
- **Responsive UI**: Built with Flutter’s Material Design principles for a consistent and adaptive interface.
- **Error Handling**: Gracefully manages API errors, connectivity issues, and invalid inputs.
- **Scalable Architecture**: Structured using Clean Architecture principles for maintainability and testability.

---

## 🏗️ Architecture Overview

Weathered follows **Clean Architecture** to ensure separation of concerns and modularity:

- **Presentation Layer**
    - Contains Flutter widgets and UI components.
    - Uses **BLoC (Business Logic Component)** for state management.
    - Handles user interactions and displays data.

- **Domain Layer**
    - Defines core business logic and entities.
    - Contains use cases that orchestrate data flow between layers.

- **Data Layer**
    - Responsible for fetching data from external sources (HTTP APIs).
    - Includes repositories and data models.
    - Uses the `http` package for API calls.

This layered approach makes the app easier to extend, test, and maintain.

---

## 🔄 State Management with BLoC

Weathered uses the **BLoC pattern** to manage state:

- **Events**: Represent user actions (e.g., search for a city’s weather).
- **States**: Represent UI states (loading, success, error).
- **Bloc Classes**: Handle events, perform API calls, and emit new states.

This ensures predictable state transitions and a reactive UI.

---

## 🌐 API Integration

- Weathered uses the `http` package to make REST API calls.
- The app fetches weather data from a public weather API (e.g., [OpenWeatherMap](https://openweathermap.org/api)).
- Responses are parsed into Dart models and passed through the repository layer to the domain and presentation layers.

---

## 📂 Project Structure

```
lib/ 
├── data/ # Data layer: repositories, models, API services 
├── domain/ # Domain layer: entities, use cases, repository interfaces 
├── bloc/ # State management │ 
├── presentation/ # UI layer: widgets, screens, BLoC classes │ 
│   └── pages/ # Screens (Home, Search) 
│   └── widgets/ # Reusable UI components 
└── main.dart # App entry point
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- API key from [OpenWeatherMap](https://openweathermap.org/api) or another weather provider

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Koenisegg484/Weathered.git
   ```
