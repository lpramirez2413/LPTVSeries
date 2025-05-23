# LPTVSeries

iOS Application built with Swift and SwiftUI that helps users discover and track TV series.

## Tech Stack

- **Swift + SwiftUI**: Primary programming language + declarative UI framework
- **Combine**: Used for reactive programming patterns (Search feature)
- **MVVM**: Architecture pattern for UI layer
- **XCTest**: Testing framework

## Setup

- Checkout the project
- Open it with Xcode 16.2 (preferred)
- Build and run

## Architecture

The project follows Clean Architecture principles with separation of concerns + custom modifications:

```
Source/
├── Core/                   # Core business logic and domain models
├── Features/               # Feature-specific implementations
│   └── Shows/              # feature folder
│       ├── Data/           # Data layer (Repositories, Local & Remote DataSources)
│       ├── Domain/         # Domain layer (UseCases, Models)
│       └── Presentation/   # User Interaction layer (Views, ViewModels)
└── Main/                   # Main app configuration and setup
```

The architecture is organized in layers:
- **Presentation Layer**: SwiftUI views and ViewModels (MVVM)
- **Domain Layer**: Business logic, use cases, and domain models
- **Data Layer**: Repositories and data sources (Local: CoreData and Remote: API)

## Features

### 1. Recent Episodes
- List of recently aired episodes
- Test showcase feature demonstrating testing approach
- Includes tests for data sources, repositories, and use cases

### 2. Shows Management
- Browse TV shows
- Search TV shows
- Favorite shows
- Detailed show information (Rating, summary, seasons, episodes)

### 3. People Section
- Browse cast
- Search people
- Detailed person information (Shows, episodes)

### 4. Favorites
- Dedicated section for favorited shows

### 5. Security
- FaceID and TouchID support
- Setup in settings

## Testing

The project includes unit tests demonstrating the testing approach for:
- Data sources
- Repositories
- Use cases

Note: While the "Get Recents" feature is tested as a showcase, other features are lack of test coverage because of time.

## Future Improvements could have been done

### 1. Design System
- Implement a comprehensive and advanced design system
- Typography and spacing
- Color palette, theming and tokens

### 2. Test Coverage
- Code coverage for presentation layer
- Tests for remaining features
- UI tests with XCUITest or Snapshotesting

### 3. Dark Mode
- Dark mode support
- Dynamic color schemes
- Custom dark mode themes

## Additional information
1. Inside the root folder you will find a postman collection I used for testing the API
2. 
