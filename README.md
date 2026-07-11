# Flutter Clean Architecture

A Flutter project built using **Clean Architecture**, **BLoC**, and **Feature-First** architecture.

## Architecture

- Clean Architecture
- BLoC State Management
- AutoRoute (Navigation)
- GetIt (Dependency Injection)
- SharedPreferences (Local Storage)
- Json (Asset) Data

## Features

- Login
- Home
- Profile

## Data Flow

```
JSON (Asset)
  ↓
Data Source
  ↓
Model
  ↓
Repository
  ↓
Entity
  ↓
Use Case
  ↓
BLoC
  ↓
UI
```

## Setup

Install dependencies:

```bash
flutter pub get
```

Generate code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the app:

```bash
flutter run
```