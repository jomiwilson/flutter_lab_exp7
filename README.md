# Experiment 7 – Application State Management and Serialization

**Course:** 24CS2016 – Building Applications using Flutter  
**Name:** Jomi W  
**Register No.:** URK23CS1299

## Aim

To manage application state and serialize/deserialize data using JSON.

## Description

This experiment introduces application state management and JSON serialization in Flutter. A Student model class is created with toJson and fromJson methods to convert between Dart objects and JSON. A list is maintained as application state and updated using setState, and the data is displayed using ListView.builder.

## Source files

- `lib/student.dart`
- `lib/main.dart`

## How to run

The repository contains the Dart source and `pubspec.yaml`. Generate the platform folders once, then run:

```bash
flutter create .
flutter pub get
flutter run
```

## Result

A Flutter application for state management and serialization was developed successfully. The Student object was converted to JSON using toJson and converted back using fromJson. The student list was updated using setState and displayed dynamically using ListView.builder. The application maintained changing student data and converted data between Dart objects and JSON.
