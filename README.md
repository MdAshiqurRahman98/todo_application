# To-Do App

A modern **Flutter To-Do App** designed to manage tasks efficiently. This project demonstrates **Flutter development**, **API integration**, and **state management** using a clean and maintainable architecture.

---

## Overview

**To-Do App** allows users to:

- Create, view, update, and delete tasks
- See task details with creation date
- Refresh the task list
- Handle network requests with loading indicators

The app interacts with a REST API backend to persist and manage task data.

---

## Features

- **Add Task:** Users can add new tasks with title and description.
- **View Task:** View individual task details in a clean UI.
- **Update Task:** Edit existing tasks and update information.
- **Delete Task:** Remove tasks from the backend.
- **Pull-to-Refresh:** Refresh the task list for the latest data.
- **Responsive UI:** Compatible with multiple device sizes.

---


## Screenshots



<!-- First row: 2 images -->
<div style="display: flex; gap: 60px;">
  <img height="600" alt="Screenshot_20260228_154658" src="https://github.com/user-attachments/assets/afb4c339-52c9-4468-b680-b33fde9338cc" />
  <img src="https://github.com/user-attachments/assets/7136b3cd-9378-4aaa-a448-c4bcc30a8206" height="600" />
</div>

<!-- Second row: 2 images -->
<div style="display: flex; gap: 60px; margin-top: 60px;">
  <img src="https://github.com/user-attachments/assets/78a1ecca-9f22-4b94-8007-94d82fac4af1" height="600" />
  <img src="https://github.com/user-attachments/assets/a245045c-513e-4312-a83e-69f4fb04783b" height="600" />
</div>


---

## Installation

1. **Clone the repository**

```bash
git clone https://github.com/MdAshiqurRahman98/todo-application.git
```

2. **Navigate to the project directory**
```bash
cd todo_application
```

3. **Install dependencies**

```bash
flutter pub get
```

4. **Run the app**

```bash
flutter run
```

---

## Tech Stack

* **Flutter & Dart** – Frontend
* **REST API** – Backend integration
* **Firebase** – Optional backend support
* **HTTP package** – Network requests
* **Intl package** - Date formatting

---

## Folder Structure

```
lib/
 ├── model/          # Data models
 ├── screens/        # UI screens (Home, TaskForm, ViewTask)
 ├── services/       # NetworkResponse & Network Callers
 └── urls.dart       # API endpoint definitions
```