# Items

A SwiftUI application for browsing and exploring items across different categories with detailed product information, ratings, and beautiful imagery.

## Features

- Browse items across four categories: Men's clothing, Women's clothing, Jewelery, and Electronics
- Tab-based navigation for easy category switching
- Search functionality to filter items by name in real-time
- Detailed item view with full descriptions, pricing, and ratings
- Light and dark mode toggle with persistent preference
- Smooth navigation between category list and detail views
- Modular view components for clean architecture

## Architecture

The project demonstrates modern SwiftUI patterns and view composition:

### Model

- **Item** - Decodable model representing item data with product information
  - Nested **Rating** struct for rate and count
  - **ItemCategory** enum for category classification
  - Conforms to `Identifiable` and `Hashable` for SwiftUI list support

### Service

- **ItemService** - Service class that loads and decodes item data from JSON bundle resource
  - Uses `JSONDecoder` to parse items from `items.json`
  - Provides search functionality with case-insensitive filtering
  - Category filtering to display items by selected category
  - Manages item data and category-specific filtering
  - Uses `@Observable` macro for modern state management

### Views

**Main Views:**

- **ContentView** - Main container with TabView for category navigation
  - Uses `@AppStorage` for persistent dark mode preference
  - Four tabs for different item categories
  - Applies color scheme based on user preference

- **CategoryView** - Category-specific list view with searchable items
  - Real-time search filtering with `searchable` modifier
  - Displays item title and rating in list cells
  - NavigationStack with type-safe routing to detail view
  - Dark mode toggle button in navigation bar
  - Filters items by category on appear

- **ItemView** - Detailed item view with image, description, and statistics
  - ScrollView with custom navigation bar
  - Composed of modular sub-views
  - Displays complete item information

**Item Detail Sub-Views (ItemViews/):**

- **BodyView** - Container for item name, category, and description
  - Displays formatted item information with clear labels

- **ImageView** - Full-width item image in detail view
  - Uses `AsyncImage` for remote image loading
  - Includes loading placeholder and error handling
  - Styled with shadow and fixed dimensions

- **ItemStatsView** - Displays item statistics (price, rating, count)
  - Shows formatted price, rating out of 5, and review count

## State Management

- `@State` for local view state (search text, item service instance)
- `@AppStorage` for persistent dark mode preference
- `@Observable` macro for service class state management
- Reactive filtering with computed properties based on `@State` changes
- NavigationStack with type-safe routing using `Item` as destination type

## Technologies

- **SwiftUI** - Modern declarative UI framework
- **NavigationStack** - Programmatic navigation with type-safe routing
- **JSON Decoding** - Custom Decodable implementation with CodingKeys
- **Searchable** - Built-in search functionality with real-time filtering
- **AppStorage** - Persistent user preferences for theme
- **@Observable** - Modern observation framework for state management
- **AsyncImage** - Asynchronous image loading from remote URLs
- **TabView** - Tab-based navigation for category selection
- **Animation** - Smooth transitions with default SwiftUI animations

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Credits

This project uses publicly available JSON data from [FakeStoreAPI](https://fakestoreapi.com/) for educational purposes. The item data is sourced from the `/products` endpoint at https://fakestoreapi.com/products, which provides a free, publicly accessible JSON file for practice projects.
