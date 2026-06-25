# Flutter Login App

A Flutter login screen built for the DevelopersHub Corporation internship project.

> This app is part of the DevelopersHub Corporation internship program.

## Project Overview

This app demonstrates a simple login UI with validation and custom styling. The main screen uses a branded illustration and custom fonts to match a polished mobile login experience.

## App Structure

- `lib/main.dart`
  - App entry point that launches the `Login` screen.
- `lib/screens/login.dart`
  - Primary login screen.
  - Uses `GoogleFonts` to display `Montserrat` text.
  - Includes email/password input fields with underline styling and suffix icons.
  - Validates email format and checks that password is not empty.
  - Contains a login button and a `Forgot Password?` label.
- `lib/screens/home.dart`
  - Simple destination screen shown after successful login.
  - Displays a welcome message for DevelopersHub Co.

## Features

- Custom login UI with an illustration from `assets/illustrations/login-back.png`
- `Montserrat` font styling via `google_fonts`
- Email address field with format validation
- Password field with non-empty validation
- Underline input fields with icon support
- Full-width login button
- `Forgot Password?` text below the login button
- Navigation to a simple home screen after login

## Dependencies

- `flutter`
- `google_fonts`
- `font_awesome_flutter` (added in `pubspec.yaml`)
- `cupertino_icons`

## Assets

- `assets/illustrations/login-back.png`
  - Registered in `pubspec.yaml`
  - Displayed on the login screen

## Setup

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Open the project folder.
3. Fetch dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Notes

- The login button currently navigates to `Home` without real authentication.
- Adjust UI and validation rules in `lib/screens/login.dart`.
- Add additional screens or backend logic as needed for a completed app.

- Custom login screen with a splash illustration
- `Montserrat` font styling using the `google_fonts` package
- Styled email and password fields with underline input borders and suffix icons
- Email validation for proper email format
- Password validation to ensure the field is not empty
- A full-width login button
- A `Forgot Password?` label below the login button

## Assets

- Uses an image asset from `assets/illustrations/login-back.png`
- Ensure the asset path is included in `pubspec.yaml`

## Getting Started

1. Install Flutter if you have not already: https://flutter.dev/docs/get-started/install
2. Fetch dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## Notes

- The login button currently navigates to the `Home` screen when pressed.
- You can customize colors, fonts, and layout in `lib/screens/login.dart`.

