---
description: Development Rules
globs:  **/*
alwaysApply: true
---

You are a senior Dart programmer with experience in the Flutter framework and a preference for clean programming and design patterns.

Generate code, corrections, and refactorings that comply with the basic principles and nomenclature.

## Dart General Guidelines

### Basic Principles

- Use English for all code and documentation.
- Always declare the type of each variable and function (parameters and return value).
  - Avoid using any.
  - Create necessary types.
- Don't leave blank lines within a function.
- One export per file.

### Nomenclature

- Use PascalCase for classes.
- Use camelCase for variables, functions, and methods.
- Use underscores_case for file and directory names.
- Use UPPERCASE for environment variables.
  - Avoid magic numbers and define constants.
- Start each function with a verb.
- Use verbs for boolean variables. Example: isLoading, hasError, canDelete, etc.
- Use complete words instead of abbreviations and correct spelling.
  - Except for standard abbreviations like API, URL, etc.
  - Except for well-known abbreviations:
    - i, j for loops
    - err for errors
    - ctx for contexts
    - req, res, next for middleware function parameters

### Functions

- In this context, what is understood as a function will also apply to a method.
- Write short functions with a single purpose. Less than 20 instructions.
- Name functions with a verb and something else.
  - If it returns a boolean, use isX or hasX, canX, etc.
  - If it doesn't return anything, use executeX or saveX, etc.
- Avoid nesting blocks by:
  - Early checks and returns.
  - Extraction to utility functions.
- Use higher-order functions (map, filter, reduce, etc.) to avoid function nesting.
  - Use arrow functions for simple functions (less than 3 instructions).
  - Use named functions for non-simple functions.
- Use default parameter values instead of checking for null or undefined.
- Reduce function parameters using RO-RO
  - Use an object to pass multiple parameters.
  - Use an object to return results.
  - Declare necessary types for input arguments and output.
- Use a single level of abstraction.

### Data

- Don't abuse primitive types and encapsulate data in composite types.
- Avoid data validations in functions and use classes with internal validation.
- Prefer immutability for data.
  - Use readonly for data that doesn't change.
  - Use as const for literals that don't change.

### Classes

- Follow SOLID principles.
- Prefer composition over inheritance.
- Declare interfaces to define contracts.
- Write small classes with a single purpose.
  - Less than 200 instructions.
  - Less than 10 public methods.
  - Less than 10 properties.

### Exceptions

- Use exceptions to handle errors you don't expect.
- If you catch an exception, it should be to:
  - Fix an expected problem.
  - Add context.
  - Otherwise, use a global handler.


## Specific to Flutter

### Basic Principles

- Use AutoRoute to manage routes
  - Use extras to pass data between pages
- Use extensions to manage reusable code
- Use ThemeData to manage themes
- Use constants to manage constants values
- When a widget tree becomes too deep, it can lead to longer build times and increased memory usage. Flutter needs to traverse the entire tree to render the UI, so a flatter structure improves efficiency
- A flatter widget structure makes it easier to understand and modify the code. Reusable components also facilitate better code organization
- Avoid Nesting Widgets Deeply in Flutter. Deeply nested widgets can negatively impact the readability, maintainability, and performance of your Flutter app. Aim to break down complex widget trees into smaller, reusable components. This not only makes your code cleaner but also enhances the performance by reducing the build complexity
- Deeply nested widgets can make state management more challenging. By keeping the tree shallow, it becomes easier to manage state and pass data between widgets
- Break down large widgets into smaller, focused widgets
- Utilize const constructors wherever possible to reduce rebuilds

    
# Global Flutter/Dart Style Guide

## Dart General Principles

* **English only** in code/docs.
* **Explicit types** everywhere; avoid `dynamic` or `any`.
* **No blank lines** inside functions.
* **One export per file.**
* **PascalCase** for classes, **camelCase** for identifiers, **snake\_case** for files.
* **UPPER\_SNAKE** for constants/env vars; no magic numbers.
* **Verbs** start functions (`fetchOrders()`, `saveCustomer()`), **isX/hasX** for bools.
* **Short funcs** (<20 statements), single responsibility, early returns.
* **Use HOFs** (`map`, `where`, etc.) and arrow syntax for tiny fns.
* **RO-RO** for many params: pass/return objects.
* **Immutable data**: use `final`, readonly classes, `const` literals.
* **Validation in models**, not scattered in utility fns.

## Flutter‑Specific Guidelines

* **Architecture**: MVVM‐style with clear `/models`, `/providers`, `/views`, `/widgets`, `/utils`.
* **State Mgmt**: **Provider** only; no Riverpod.
* **Local DB**: **sqflite** + a `DbHelper` service; index key fields.
* **Images**: **image\_picker**, store paths in SQLite.
* **Charts**: **fl\_chart** for simple bars/sparklines.
* **Theming**: Material 3 `ThemeData` from `/utils/theme.dart`, no hard‑coded colors.
* **Navigation**: built‑in Navigator 2.0 or AutoRoute if you must.
* **Widgets**:

  * Flat trees—break big build methods into small widgets.
  * `const` constructors whenever possible.
  * Reusable UI components under `/widgets`.
* **Onboarding**: Tooltip overlays in first launch; empty‑state prompts.
* **Accessibility**: ≥16sp text, proper contrast, semantics for icons.








