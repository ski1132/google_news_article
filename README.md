# 📰 Google News Article App

A comprehensive Flutter application for browsing news articles, built with **Clean Architecture** and **GetX** state management.

---

## 🚀 Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (v3.29.0) / [Dart](https://dart.dev/) (v3.7.0)
- **State Management:** [GetX](https://pub.dev/packages/get)
- **Networking:** [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit)
- **Data Models:** [Freezed](https://pub.dev/packages/freezed) & [JsonSerializable](https://pub.dev/packages/json_serializable)
- **UI Utilities:** [Sizer](https://pub.dev/packages/sizer), [Skeletonizer](https://pub.dev/packages/skeletonizer), [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
- **Localization:** Custom implementation (formerly EasyLocalization)
- **Environment:** [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)

## ✨ Features

- **Categorized News:** Browse news by Latest, World, Business, Entertainment, etc.
- **Favorites System:** Save interesting articles to read later.
- **Multi-Language Support:** Full support for English (EN) and Thai (TH).
- **Responsive UI:** Optimized for various screen sizes using `sizer`.
- **Robust Error Handling:** User-friendly error messages and loading states.

---

## 🛠️ Getting Started

### Prerequisites

1.  **Flutter SDK:** Ensure you have Flutter installed and configured.
2.  **Environment File:** Import your `.env` file to the root project directory.

### Installation

1.  **Clean the project:**

    ```bash
    flutter clean
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run Code Generation:**
    This project relies on code generation for models and APIs.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

---

## 🏃‍♂️ Running the App

The project uses flavors to manage different environments.

### Development

```bash
flutter run -t lib/main_dev.dart --flavor dev
```

### Production

```bash
flutter run -t lib/main_prod.dart --flavor prod
```

---

## 🧪 Testing

Run unit tests (using `mocktail`):

```bash
flutter test
```

---

## 📂 Project Structure

```text
lib
├── bindings        # 🔗 Dependency injection bindings (GetX)
├── controllers     # 🎮 State management controllers (GetX)
├── flavors         # 🌍 Environment configuration (Dev/Prod)
├── gen             # 📦 Generated assets and fonts
├── language        # 🗣️ Localization strings
├── models          # 💾 Data models (Freezed/JsonSerializable)
├── modules         # 📱 UI Screens and Pages organized by feature
├── prefs           # ⚙️ Shared preferences management
├── remote          # ☁️ API definition (Retrofit/Dio)
├── repository      # 🗄️ Data repository interfaces and implementations
├── routes          # 🛣️ Application routing
├── services        # 🛠️ External services (Dio, etc.)
├── styles          # 🎨 App styling resources (Colors, text styles)
├── utils           # 🧰 Utility classes (Formatters, etc.)
└── widgets         # 🧩 Reusable widgets
```
