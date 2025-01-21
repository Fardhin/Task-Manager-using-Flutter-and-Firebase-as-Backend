# Task-Manager-using-Flutter-and-Firebase-as-Backend


This code represents a **Task Manager** application built with Flutter, using Firebase Firestore as the backend for real-time data storage and updates. The app allows users to add, view, update, and delete tasks. It features a user-friendly interface with a focus on task management functionality.

## Features

### Real-time Task Management:
- Tasks are stored in Firebase Firestore and updated in real-time.
- Changes (additions, updates, deletions) reflect immediately across all connected devices.

### Task Details:
- Users can add a task title, description, status, and due date.
- Task statuses include **Pending**, **In Progress**, and **Completed**.

### Task List View:
- Displays all tasks in a scrollable list.
- Shows task details, including title, description, status, due date, and creation timestamp.

### Interactive Controls:
- **Checkbox** for marking tasks as completed.
- **Delete button** for removing tasks.

### Add Task Dialog:
- Allows users to input task details in a pop-up form.
- Provides a date picker to select the due date.

### Random ID Generator:
- Generates unique alphanumeric IDs for tasks.

### Gradient Background:
- A visually appealing gradient enhances the user interface.

## Technical Details

### Flutter Framework:
- Provides a cross-platform solution for building the app.
- Utilizes Material Design for UI components.

### Firebase Integration:
- Firebase Core is initialized for app connection.
- Firebase Firestore is used for storing and retrieving task data.

### UI Widgets:
- **StreamBuilder**: Displays real-time task updates from Firestore.
- **ListTile**: Renders individual task details.
- **AlertDialog**: Provides a modal dialog for adding new tasks.

### Date Handling:
- Uses Flutter’s built-in **DateTime** and **showDatePicker** for date selection and formatting.

### Version Control:
- Structured to be maintainable and easy to integrate into GitHub or other version control platforms.

## Future Enhancements
- Add user authentication for personal task management.
- Implement task prioritization and categorization.
- Include notification reminders for task due dates.

---

## How to Run

1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/task-manager.git
   cd task-manager
