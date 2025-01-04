
# Rick and Morty Explorer

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that allows users to explore characters from the Rick and Morty series. The app demonstrates clean architecture, efficient state management, API integration, and a polished UI/UX experience.

### Key Features

- **Character List**: Displays a paginated list of characters fetched from the [Rick and Morty API](https://rickandmortyapi.com/).
- **Search & Filtering**: Search characters by name and filter by status (Alive, Dead, Unknown) and species (e.g., Human, Alien).
- **Favorite Characters**: Mark characters as favorites and view them on a separate screen.
- **Character Details**: Detailed view showing character information, including origin, current location, and episodes they appear in.
- **Error Handling**: Displays loading indicators during data fetching and user-friendly error messages for network issues or no results found.

### Project Structure

The project follows a modular structure adhering to clean architecture principles:

```
lib/
├── core/                # Core modules (themes, routes, dependency injection, shared widgets)
├── features/            # Feature-specific modules
│   ├── characters/      # Character listing and details
│   ├── favorites/       # Favorite characters feature
├── main.dart            # Application entry point
```

### Packages Used

This project utilizes several Flutter packages to enhance development efficiency and maintainability:

- **State Management**:
  - `flutter_bloc`: State management library.
  - `bloc`: Business logic component.
  - `equatable`: Simplifies object comparison.
  - `talker_bloc_logger`: Logging state changes.

- **Networking**:
  - `dio`: HTTP client for API requests.
  - `talker_dio_logger`: Logging HTTP requests.

- **Navigation and Routing**:
  - `go_router`: Simplifies navigation between screens.

- **Utilities**:
  - `get_it`: Dependency injection.
  - `flutter_hooks`: Enhances state management.
  - `path_provider`: Accessing local file paths.
  - `intl`: Localization and formatting.
  - `google_fonts`: Custom fonts integration.

- **Database**:
  - `realm`: Local database management for storing favorite characters.

- **Pagination**:
  - `enhanced_paginated_view`: Implements infinite scroll for character lists.

### Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mohamed296/rick_and_morty.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd rick_and_morty
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the application**:
   ```bash
   flutter run
   ```

### Demonstration

For a visual demonstration of the application's features, you can watch the following video:

[Demonstration Video](https://drive.google.com/file/d/1V7jL6tWvz9Wc1EljwdwVVFOsAD7oLrhK/view?usp=sharing)

