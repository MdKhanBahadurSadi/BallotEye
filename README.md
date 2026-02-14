# BallotEye: Real-Time Incident Reporting Platform

BallotEye is a modern, real-time incident reporting and monitoring platform built with Flutter. It is designed to empower observers to report incidents from the field, which can then be monitored and managed by administrators through a dedicated hub. The app features role-based access, real-time data synchronization, and geospatial visualization of incidents.

This project serves as a strong example of a full-stack Flutter application, leveraging a clean architecture and a modern tech stack to deliver a complex, real-world solution.

## Features

- **Role-Based Authentication**: Separate login and UI for different user roles (e.g., Observers and Administrators).
- **Real-Time Incident Feed**: A live, scrollable feed of all reported incidents, powered by Firebase Firestore.
- **Incident Reporting**: Observers can create detailed incident reports, including titles, descriptions, categories, and multiple image/video uploads.
- **Interactive Map View**: Administrators can visualize the geographic distribution of incidents on an integrated Google Map.
- **Incident Details & Moderation**: View detailed information for each incident, including comments, activity logs, and moderation tools for administrators.
- **Leaderboard**: A view to gamify and track reporting statistics by area.
- **Clean Architecture**: Organized into a feature-first, scalable folder structure.
- **Modern UI/UX**: A clean, modern interface built on Material 3, with animations and a responsive design.

## Tech Stack

- **Framework**: Flutter
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Backend**: Firebase (Authentication, Firestore, Storage, Cloud Messaging)
- **Data Modeling**: Freezed & `json_serializable`
- **Mapping**: Google Maps Flutter
- **Asynchronous Programming**: `Future`s and `Stream`s

## Setup and Configuration

To run this project, you will need to configure your own Firebase backend.

1.  **Clone the repository:**
    ```sh
    git clone <repository-url>
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

3.  **Configure Firebase:**
    - Follow the instructions on the [FlutterFire CLI documentation](https://firebase.google.com/docs/flutter/setup?platform=ios) to set up your own Firebase project.
    - Run the configuration command:
      ```sh
      flutterfire configure
      ```
    - This will generate a `lib/firebase_options.dart` file with your project's unique Firebase credentials.

4.  **Run the app:**
    ```sh
    flutter run
    ```

## Project Structure

The project follows a feature-first architectural pattern, where code is organized by features (e.g., `auth`, `reports`, `map`). This makes the codebase easy to navigate, scale, and maintain.

```
lib/
├── app.dart
├── core/
├── features/
│   ├── auth/
│   ├── reports/
│   ├── map/
│   ├── ...
├── shared/
└── main.dart
```
