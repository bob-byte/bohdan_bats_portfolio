# Bohdan Bats Portfolio

Personal portfolio application built with Flutter for web, mobile, and desktop.

## Live Website

The website is available here: [https://bohdan-bats-portfolio.web.app/](https://bohdan-bats-portfolio.web.app/)

## Features

- Responsive UI with separate desktop and mobile layouts.
- Multi-page navigation (`/`, `/about`, `/projects`, `/blog`, `/contact`).
- Blog posts loaded from Firebase Firestore (`articles` collection).
- Desktop window sizing support using `window_manager`.
- Social links and project presentation sections.

## Tech Stack

- Flutter (Dart SDK `^3.10.8`)
- Firebase Core + Cloud Firestore
- `google_fonts`, `flutter_svg`, `url_launcher`, `window_manager`

## Project Structure

```text
lib/
  main.dart                  # App entrypoint + Firebase initialization
  routes.dart                # Route generation + desktop/mobile switching
  desktop/                   # Desktop pages and widgets
  mobile/                    # Mobile pages and widgets
  components/                # Shared reusable widgets
  data/                      # Data models (e.g. article)
  app_constants.dart         # App text and color constants
  firebase_options.dart      # FlutterFire-generated Firebase config
```

## Prerequisites

- Flutter SDK installed and configured ([Install guide](https://docs.flutter.dev/get-started/install))
- Dart SDK (comes with Flutter)
- Xcode (for iOS/macOS), Android Studio (for Android), or Chrome (for web)

Check your setup:

```bash
flutter doctor
```

## Setup

1. Clone the repository.
2. Install dependencies:

```bash
flutter pub get
```

3. Ensure Firebase files are present (already committed in this repo):
   - `lib/firebase_options.dart`
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
   - `macos/Runner/GoogleService-Info.plist`

## Run the App

List available devices:

```bash
flutter devices
```

Run on your preferred platform:

```bash
flutter run -d chrome
flutter run -d macos
flutter run -d windows
flutter run -d ios
flutter run -d android
```

## Firebase Notes

- The app initializes Firebase in `main.dart` using `DefaultFirebaseOptions.currentPlatform`.
- Blog pages subscribe to Firestore collection `articles`.
- Linux Firebase options are not configured in `firebase_options.dart` by default.

## Build

```bash
flutter build web
flutter build apk
flutter build ios
flutter build macos
flutter build windows
```

## App Icon Generation

This project uses `flutter_launcher_icons` with config in `flutter_launcher_icons.yaml`.

```bash
dart run flutter_launcher_icons
```

## Useful Commands

```bash
flutter analyze
flutter test
flutter pub outdated
```
