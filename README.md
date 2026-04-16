## English Translation 🈂️
### 🚀 Weekend Project: Personal Habit Tracker App
Overall Project Goal: Build a complete daily habit tracking application to master basic CRUD operations, link tables with the Authentication system (Auth), and implement all of this within a Flutter environment using Clean Architecture and State Management with BLoC or Cubit.

---

## 🛠 Technologies Used
### 1. Frontend & App: Flutter

### 2. State Management: BLoC / Cubit

### 3. Architecture: Clean Architecture

### 4. Backend & Database: Supabase (Auth, Postgres)

## 🗄️ Database Requirements (Supabase Schema)
Students must build the following tables in Supabase and set up the relationships between them:

### 1.  profiles Table (Optional / Bonus):

* id (UUID - Primary Key - Foreign Key to auth.users.id)

* username (Text)

* created_at (Timestamp)

### 2.  habits Table:

* id (UUID - Primary Key)

* title (Text - Habit name)

* user_id (UUID - Foreign Key to auth.users.id)

* created_at (Timestamp)

### 3.  habit_logs Table:

* id (UUID - Primary Key)

* habit_id (UUID - Foreign Key to habits.id - Cascade Delete)

* log_date (Date)

* is_completed (Boolean - Default: false)

## 📱 Programming Requirements (Features & UI)
### Authentication:

Login and Sign Up interfaces using Email and Password.

### Habits Management:

* An interface to display the list of added habits for the currently logged-in user.

* Ability to add a new habit (e.g., Drinking water, Reading, Walking).

* Ability to delete a habit (ensuring its associated logs are automatically deleted).

# Daily Logging:

Next to each habit in the list, provide a button or Checkbox to mark whether the habit was completed for the day.

---

## 🧩 Advanced Technical Challenge (Join Query)
Instead of making two separate queries (one to fetch habits, and another to fetch logs), the student is required to:
* Write a single Join query in Supabase to fetch the "Habit" along with its "Completion Logs" in one combined list.

 **Hint for students:🎭** Look up how to use foreign tables relationships in the supabase-flutter package to fetch nested data like this: supabase.from('habits').select(', habit_logs()').

---

## 🏗️ Evaluation Criteria (Clean Architecture)
The project will not be evaluated based on the UI alone, but on the code quality and structure:

* **Data Layer:** Must contain separate AuthRepository and HabitsRepository that interact directly with Supabase.

* **Domain Layer:** Must contain the Models or Entities for Habits and Logs.

* **Presentation Layer:** The User Interface (UI) must not contain any database-related code. Communication must be handled exclusively through Cubit or BLoC.

## Error Handling: Display clear error messages to the user in case of login failure or data fetching failure.

Good luck to everyone, we look forward to seeing your creations! 🚀

---
