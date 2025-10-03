# UI Preview - Sports Skills Training App

## 🎨 Visual Mockup Description

Since this is a text-based documentation, here's a detailed description of what the UI looks like:

---

## Screen Layout

### Top Section (Header)
```
┌─────────────────────────────────────────────┐
│  [Deep Blue Gradient Background]            │
│                                              │
│  Skills Training                             │
│  Master your abilities step by step          │
│                                              │
└─────────────────────────────────────────────┘
```

### Basic Level Section
```
┌─────────────────────────────────────────────┐
│ ║ Basic                          [3 skills] │
│                                              │
│  ┌──────┐  ┌──────┐  ┌──────┐              │
│  │ 3D   │  │ 3D   │  │ 3D   │  ←scroll→    │
│  │ Card │  │ Card │  │ Card │              │
│  └──────┘  └──────┘  └──────┘              │
└─────────────────────────────────────────────┘
```

### Intermediate Level Section
```
┌─────────────────────────────────────────────┐
│ ║ Intermediate                   [3 skills] │
│                                              │
│  ┌──────┐  ┌──────┐  ┌──────┐              │
│  │ 3D   │  │ 3D   │  │ 3D   │  ←scroll→    │
│  │ Card │  │ Card │  │ Card │              │
│  └──────┘  └──────┘  └──────┘              │
└─────────────────────────────────────────────┘
```

### Advanced Level Section
```
┌─────────────────────────────────────────────┐
│ ║ Advanced                       [3 skills] │
│                                              │
│  ┌──────┐  ┌──────┐  ┌──────┐              │
│  │ 3D   │  │ 3D   │  │ 3D   │  ←scroll→    │
│  │ Card │  │ Card │  │ Card │              │
│  └──────┘  └──────┘  └──────┘              │
└─────────────────────────────────────────────┘
```

---

## 3D Card Detailed View

```
        ╔═══════════════════════╗
       ╔╝                       ╚╗  ← Shadow layer
      ╔╝  ┌───────────────────┐  ╚╗
     ╔╝   │ [Shine Effect]    │   ╚╗
    ╔╝    │                   │    ╚╗
   ║      │      ╭─────╮      │     ║
   ║      │     ╱       ╲     │     ║  ← Glassmorphism
   ║      │    │  Image  │    │     ║     overlay
   ║      │     ╲       ╱     │     ║
   ║      │      ╰─────╯      │     ║
   ║      │                   │     ║
   ║      │    Skill Name     │     ║
   ║      │                   │     ║
   ║      │   [Level Badge]   │     ║
   ║      └───────────────────┘     ║
    ╚╗                             ╔╝
     ╚╗                           ╔╝
      ╚╗                         ╔╝
       ╚═══════════════════════╝
```

### Card Components Breakdown:

1. **Outer Shadow Layer** (Bottom)
   - Black gradient shadow
   - Offset: 8px down, 4px right
   - Creates depth perception

2. **Main Card Container**
   - White to light gray gradient
   - Border radius: 24px
   - Multiple box shadows

3. **Glassmorphism Overlay**
   - Semi-transparent white
   - Gradient from 80% to 40% opacity
   - Covers entire card

4. **Shine Effect** (Top)
   - White gradient fading downward
   - Height: 60px
   - Creates glossy appearance

5. **Circular Image Frame**
   - Outer ring: Level-colored gradient
   - Inner ring: White with shadow
   - Image: Circular crop, 100x100px
   - Fallback: Gradient with icon

6. **Skill Name Text**
   - Font: Bold, 16px
   - Color: Dark gray (#424242)
   - Shadow: White glow effect
   - Letter spacing: 0.5

7. **Level Badge**
   - Gradient background (level-specific)
   - Rounded pill shape (12px radius)
   - White text, 11px, bold
   - Shadow: Colored glow

---

## Color Palette

### Background
- **Primary**: #1A237E (Deep Blue)
- **Secondary**: #283593 (Medium Blue)
- **Tertiary**: #3949AB (Light Blue)

### Level Colors

**Basic (Green)**
- Primary: #4CAF50
- Light: #81C784
- Usage: Borders, badges, shadows

**Intermediate (Orange)**
- Primary: #FF9800
- Light: #FFB74D
- Usage: Borders, badges, shadows

**Advanced (Pink/Magenta)**
- Primary: #E91E63
- Light: #F48FB1
- Usage: Borders, badges, shadows

### Card Colors
- **Background**: #FFFFFF → #FAFAFA
- **Text**: #424242
- **Overlay**: rgba(255, 255, 255, 0.8)

---

## Typography

### Header
- **Title**: 32px, Bold, White, Letter spacing: 1.2
- **Subtitle**: 16px, Regular, White 80%, Letter spacing: 0.5

### Level Headers
- **Level Name**: 24px, Bold, White, Letter spacing: 0.8
- **Count Badge**: 12px, Semi-bold, White 90%

### Card Text
- **Skill Name**: 16px, Bold, Gray, Letter spacing: 0.5
- **Level Badge**: 11px, Semi-bold, White, Letter spacing: 0.5

---

## Spacing & Dimensions

### Card
- Width: 160px
- Height: ~200px (auto-sized)
- Border Radius: 24px
- Margin: 8px horizontal, 16px vertical
- Padding: 16px

### Image
- Outer Circle: 100x100px
- Inner Circle: 92x92px (with 4px border)
- Border Width: 4px

### Sections
- Header Padding: 24px
- Section Spacing: 24px vertical
- Carousel Height: 220px
- Horizontal Padding: 16px

---

## Interactive States

### Normal State
- Scale: 1.0
- Shadow: Full opacity
- Elevation: High

### Pressed State
- Scale: 0.95
- Shadow: Slightly reduced
- Duration: 300ms
- Curve: Ease-in-out

### Loading State
- Circular progress indicator
- Gradient background
- White spinner (2px stroke)

### Error State
- Gradient background (level-colored)
- Icon: Sport-related (48px)
- Color: White

---

## Animation Details

### Card Press Animation
```
Timeline:
0ms   → Scale: 1.0
150ms → Scale: 0.95 (pressed)
300ms → Scale: 1.0 (released)
```

### Scroll Physics
- Type: BouncingScrollPhysics
- Momentum: Enabled
- Snap: Disabled
- Direction: Horizontal

---

## Accessibility Features

- **Contrast Ratios**: WCAG AA compliant
- **Touch Targets**: Minimum 48x48dp
- **Text Scaling**: Supports system font scaling
- **Screen Readers**: Semantic labels on images

---

## Sample Data Display

### Basic Level
1. **Dribbling** - Green theme
2. **Passing** - Green theme
3. **Ball Control** - Green theme

### Intermediate Level
1. **Vault** - Orange theme
2. **Sprint Training** - Orange theme
3. **Coordination** - Orange theme

### Advanced Level
1. **Agility** - Pink theme
2. **Power Moves** - Pink theme
3. **Endurance** - Pink theme

---

## Design Inspiration Keywords
- Modern
- 3D
- Glassmorphism
- Neumorphism
- Sports-tech
- Vibrant
- Depth
- Polished
- Professional
- Engaging

---

**Note**: For actual visual mockup, run the app with `flutter run` to see the live implementation with all animations and effects.
