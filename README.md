# 🧠 Personal Habit Tracker App

A modern Flutter-based habit tracking application designed to help users build consistency, track progress, and develop positive routines through a clean UI and structured data tracking.

---

## 🚀 Overview

The Personal Habit Tracker App enables users to create, manage, and monitor their daily habits efficiently. It focuses on simplicity, performance, and scalability while leveraging modern Flutter architecture and backend integration.

The app is designed to:

* Track daily habit completion
* Store logs and progress over time
* Provide insights into user consistency
* Support authentication and user-based data

---

## ✨ Features

### 🔐 Authentication

* Secure user authentication (Email / OAuth)
* Session persistence
* User-specific data isolation

### 📋 Habit Management

* Create, update, and delete habits
* Assign habits to specific users
* Flexible habit structure (daily tracking)

### ✅ Habit Logs

* Mark habits as completed
* Store completion logs with timestamps
* Track completion history

### 📊 Progress Tracking

* Count completed logs per habit
* Aggregate statistics (e.g., total completed habits)
* Prepare data for charts and analytics

### 🔄 Real-time Data Handling

* Sync habit logs with backend
* Reactive UI updates

---

## 🏗️ Architecture

The project follows a clean and scalable architecture:

```
lib/
├── core/            # shared utilities, constants
├── data/            # models, data sources
├── domain/          # business logic (entities/use cases)
├── presentation/    # UI + controllers (GetX / Bloc)
├── services/        # API / Supabase integration
└── main.dart
```

---

## 🛠️ Tech Stack

* **Flutter** – Cross-platform UI framework
* **Dart** – Programming language
* **Supabase** – Backend (Auth + Database + Realtime)
* **PostgreSQL** – Relational database
* **GetX / Bloc** – State management

---

## 📱 App Screens
<p align="center">
  <img width="200" alt="WhatsApp Image 2026-04-19 at 3 14 24 AM" src="https://github.com/user-attachments/assets/b5116421-b623-453c-942a-bebcf00189a6" />
<img width="200" alt="WhatsApp Image 2026-04-19 at 3 14 25 AM" src="https://github.com/user-attachments/assets/2f8a0a36-1824-4d73-a242-080eb4db69ee" />
<img width="200"  alt="WhatsApp Image 2026-04-19 at 3 14 25 AM (1)" src="https://github.com/user-attachments/assets/905e6701-fb8a-48ec-bb25-156fadcd9821" />
<img width="200"  alt="WhatsApp Image 2026-04-19 at 3 14 25 AM (2)" src="https://github.com/user-attachments/assets/377b25ff-90ec-49b8-aa4c-3c76225bc16c" />
</p>



---

## 🗄️ Database Design

### Users Table

* Stores user profile data
* Linked to `auth.users`

### Habits Table

* Each habit belongs to a user

### Habit Logs Table

* Stores completion logs
* Linked to habits

---

## 🔗 Relationships

* One User → Many Habits
* One Habit → Many Logs

---

## 📱 Getting Started

### Prerequisites

* Flutter SDK
* Supabase project
* Android Studio / VS Code

---

### Installation

```bash
git clone <repo-link>
cd habit_tracker_app_flutter
flutter pub get
```

---

### Run the App

```bash
flutter run
```

---

## 🔑 Environment Setup

Create a `.env` file and add:

```
SUPABASE_URL=your_url
SUPABASE_ANON_KEY=your_key
```

