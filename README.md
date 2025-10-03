# Sports Skills Training App 

A high-fidelity Flutter application showcasing 3D-style UI design for displaying sports skills grouped by proficiency levels.

## Features

- **3D Card Design**: Glassmorphism and neumorphism effects with depth and shadows
- **Level-Based Grouping**: Skills organized into Basic, Intermediate, and Advanced categories
- **Horizontal Carousels**: Smooth scrolling with momentum physics
- **Responsive Design**: Works on all screen sizes (mobile, tablet, desktop)
- **Modern UI**: Vibrant gradients, rounded corners, and polished animations
- **Interactive**: Touch feedback with scale animations
- **Error Handling**: Graceful fallbacks for image loading failures

## Design Highlights

- **Glassmorphism**: Semi-transparent overlays with frosted glass effect
- **3D Depth**: Multiple shadow layers creating floating card appearance
- **Color-Coded Levels**:
  - 🟢 Basic: Green gradient (#4CAF50)
  - 🟠 Intermediate: Orange gradient (#FF9800)
  - 🔴 Advanced: Pink gradient (#E91E63)
- **Circular Image Frames**: With gradient borders and inner shadows
- **Smooth Animations**: 300ms transitions with scale effects

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   └── skill.dart              # Skill data model with JSON parsing
├── screens/
│   └── skills_screen.dart      # Main screen with grouped carousels
└── widgets/
    └── skill_3d_card.dart      # Reusable 3D card widget
```

## Getting Started

### Prerequisites
- Flutter SDK 3.4.3 or higher
- Dart SDK 3.0 or higher

### Installation

1. **Clone the repository** (or ensure you're in the project directory)
   ```bash
   cd sport_skill
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running on Specific Platforms

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows

# macOS
flutter run -d macos
```

## Data Format

The app parses JSON data in the following format:

```json
[
  {
    "name": "Dribbling",
    "level": "Basic",
    "image": "https://example.com/image.jpg"
  },
  {
    "name": "Vault",
    "level": "Intermediate",
    "image": "https://example.com/image.jpg"
  },
  {
    "name": "Agility",
    "level": "Advanced",
    "image": "https://example.com/image.jpg"
  }
]
```

### Customizing Data

Edit the JSON data in `lib/screens/skills_screen.dart`:

```dart
const jsonData = '''
[
  {"name": "Your Skill", "level": "Basic", "image": "url"},
  ...
]
''';
```

## Key Components

### Skill Model (`lib/models/skill.dart`)
- Data class for skill objects
- JSON serialization/deserialization
- Type-safe properties

### Skill3DCard Widget (`lib/widgets/skill_3d_card.dart`)
- Reusable 3D card component
- Glassmorphism effects
- Touch animations
- Image loading with fallbacks
- Level-specific color theming

### SkillsScreen (`lib/screens/skills_screen.dart`)
- Main screen layout
- JSON parsing and grouping logic
- Three horizontal carousels (Basic, Intermediate, Advanced)
- Gradient background
- Level headers with skill counts

## Customization

### Changing Colors

Edit gradient colors in `lib/widgets/skill_3d_card.dart`:

```dart
LinearGradient _getLevelGradient() {
  switch (widget.level.toLowerCase()) {
    case 'basic':
      return const LinearGradient(
        colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
      );
    // ... modify other levels
  }
}
```

### Adjusting Card Size

In `lib/widgets/skill_3d_card.dart`, modify:

```dart
Container(
  width: 160,  
)
```

### Modifying Background

In `lib/screens/skills_screen.dart`, update:

```dart
gradient: LinearGradient(
  colors: [
    const Color(0xFF1A237E),  
    const Color(0xFF3949AB),
  ],
),
```

## Screenshots

See `UI_PREVIEW.md` for detailed visual mockup descriptions.

## Documentation

- **DESIGN_DOCUMENTATION.md**: Complete design system documentation
- **UI_PREVIEW.md**: Detailed visual mockup descriptions

## Technical Details

- **Framework**: Flutter 3.4.3+
- **Language**: Dart
- **Design Pattern**: Widget composition
- **State Management**: StatefulWidget with setState
- **Animation**: SingleTickerProviderStateMixin
- **Physics**: BouncingScrollPhysics for natural scrolling

## Platform Support

- ✅ iOS
- ✅ Android
- ✅ Web (requires CORS-enabled image URLs)
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Learning Resources

This project demonstrates:
- Custom widget creation
- Gradient and shadow effects
- JSON parsing and data grouping
- Horizontal scrollable lists
- Touch interactions and animations
- Responsive design principles
- Material Design 3 implementation

##  License

This project is created as an assignment/demonstration project.

## Contributing

Feel free to fork and modify for your own projects!

---

**Created**: 2025-10-03  
**Design Style**: 3D Glassmorphism/Neumorphism  
**Target**: Sports-Tech Applications
