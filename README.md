# Personal Expense Tracker

A Flutter application for tracking personal expenses with features like adding, viewing, sorting, and filtering expenses. The application uses several packages such as Hive for local storage, Provider for state management, Google Fonts, flutter_local_notifications, Lottie, Shimmer, Iconsax, etc. It is designed following the Clean Architecture pattern.

## Overview

The Personal Expense Tracker app allows users to manage their daily expenses efficiently. Users can add, view, sort, and filter their expenses by category and time. The app also provides functionalities to update, delete, and track daily and total expenses.

## Features

- **Add Expense**: Record your daily expenses with details.
- **View Expenses**: View all your recorded expenses in a list.
- **Sort Expenses**: Sort expenses by date in ascending or descending order.
- **Filter Expenses**: Filter expenses by categories and time periods.
- **Update Expense**: Edit existing expense records.
- **Delete Expense**: Remove expenses from the list.
- **Track Daily and Total Expenses**: Monitor your daily spending and overall expenses.
- **Local Notifications**: Get daily reminders to record your expenses.

## Architecture

The application follows the Clean Architecture pattern to ensure a scalable, maintainable, and testable codebase. It separates the code into different layers:

- **Presentation Layer**: Contains UI code and handles user interactions.
- **Domain Layer**: Contains business logic and entities.
- **Data Layer**: Handles data fetching, storage, and manipulation.

## Dependencies

The app uses the following packages:

- **[Hive](https://pub.dev/packages/hive)**: Local storage solution.
- **[Provider](https://pub.dev/packages/provider)**: State management.
- **[Google Fonts](https://pub.dev/packages/google_fonts)**: Custom fonts.
- **[flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)**: Notifications.
- **[Lottie](https://pub.dev/packages/lottie)**: Animations.
- **[Shimmer](https://pub.dev/packages/shimmer)**: Loading indicators.
- **[Iconsax](https://pub.dev/packages/iconsax)**: Icon pack.

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/mohammedakbark/Expense-Tracker.git
    cd expense_tracker
    ```

2. **Install dependencies**:
    ```sh
    flutter pub get
    ```

3. **Run the application**:
    ```sh
    flutter run
    ```

## Usage

1. **Adding an Expense**:
    - Navigate to the "Add Expense" screen.
    - Enter the expense details such as name, amount, date, and category.
    - Press the "Add" button to save the expense.

2. **Viewing Expenses**:
    - Go to the "View Expenses" screen to see the list of all recorded expenses.
    - Use the sort and filter options to organize and view specific expenses.

3. **Sorting Expenses**:
    - Use the sort button on the "View Expenses" screen to sort by date in ascending or descending order.

4. **Filtering Expenses**:
    - Use the filter option to filter expenses by category and time period.

5. **Updating an Expense**:
    - Select an expense from the list and navigate to the "Edit Expense" screen.
    - Modify the details and save the changes.

6. **Deleting an Expense**:
    - Swipe left on an expense in the list to delete it.



