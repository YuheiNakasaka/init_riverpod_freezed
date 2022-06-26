# init_riverpod_freezed

This is a brick of mason to generate a new Flutter project.

_Generated by [mason](https://github.com/felangel/mason) 🧱_

## Features

It creates a simple todo app with riverpod.

### Packages

- riverpod
- freezed
- pedantic_mono

### Architectures

```
lib
├── domain
│   ├── home
│   │   ├── home_page.dart
│   │   └── widgets
│   │       ├── add_todo_form.dart
│   │       └── todo_list.dart
│   └── todo
│       ├── notifiers
│       │   └── todo_notifier.dart
│       └── states
│           ├── todo.dart
│           └── todo.freezed.dart
├── entrypoint.dart
└── main.dart
```

## Getting Started 🚀

### Install

```
dart pub global activate mason_cli
```

or

```
brew tap felangel/mason
brew install mason
```

### Adding the brick

```
mason add -g init_riverpod_freezed --git-url https://github.com/YuheiNakasaka/init_riverpod_freezed
```

### Generate

```
mason make init_riverpod_freezed
> ? What is your project name? (todo) sample_app
```