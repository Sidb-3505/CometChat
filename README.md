# 📱 CometChat Flutter App

A fully functional Flutter chat application built using [CometChat UIKit](https://www.cometchat.com/), featuring:

- 🔐 Login with UID
- 📱 Bottom Navigation Bar with:
    - 💬 Chats Section
    - 📞 Calls Section
    - 👥 Users Section
- 🧑‍🤝‍🧑 1:1 Chat Screen with:
    - 🎙️ **Send Voice Note**
    - 📞 Audio Calling
    - 🎥 Video Calling
- ➕ Add New User (FAB Menu)
- 🚪 Logout Option via FAB

---

## ✨ Features

### ✅ Login with UID
Users can log in using their unique identifier (UID). No registration form is needed — just enter UID and go!

### 📲 Bottom Navigation
The app features a bottom navigation bar for seamless access to:
- **Chats** — one-on-one and group conversations
- **Calls** — list of previous calls and ongoing call functionality
- **Users** — explore and search all users

### 💬 Chat Screen
- Send and receive messages using CometChat’s robust UI Kit
- Supports text, emojis, and media

### 📞 Audio & Video Calls
- Initiate **voice** and **video** calls directly from chat screens
- Leverages CometChat's built-in call support for a seamless experience

### ➕ Add User
- Easily create a new user using a floating action button (FAB)
- Fast integration using CometChat’s `createUser()` method

### 🚪 Logout
- Logout the current session via FAB
- Clear session and return to the login screen

---

## 🛠️ Tech Stack

- **Flutter** (UI Framework)
- **CometChat UI Kit** (Chat, Calls, Auth)
- **Dart** (Programming Language)

---

## 📷 Screenshots

| Login Screen                   | Chats Screen                   |
| ![Login](screenshots/login.png) | ![Chats](screenshots/chats.png) |
|:-------------------------------:|:-------------------------------:|
| Calls Screen                   | Users Screen                   |
| ![Calls](screenshots/calls.png) | ![Users](screenshots/users.png) |
---


## 🚀 Getting Started

1. **Clone the repo**
    ```bash
       git clone https://github.com/yourusername/cometchat-flutter-app.git
       cd cometchat-flutter-app

2. **Install dependencies**
    ```bash
       flutter pub get

3. **Configure CometChat**
    ```bash
       * Go to CometChat Dashboard
       * Create a new app and get the following:
            * App ID
            * Region
            * Auth Key
       * Replace these values in your initialization code:

4. **Run the app**
    ```bash
       flutter run