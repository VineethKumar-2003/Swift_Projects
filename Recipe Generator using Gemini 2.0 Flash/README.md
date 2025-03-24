# Recipe Generator using Gemini 2.0 Flash

## Overview
Recipe Remixer is a smart recipe generator that leverages Google Gemini 2.0 Flash to provide AI-powered recipe suggestions based on user-inputted ingredients. This app aims to help users create delicious meals with what they have at like at that moment, reducing food waste and encouraging creativity in the kitchen.

## Features
- 🧠 AI-Powered Recipe Generation – Uses Gemini 2.0 Flash for intelligent recipe suggestions.

- 🍽️ Ingredient-Based Suggestions – Enter available ingredients and get relevant recipes.

- 📖 Step-by-Step Instructions – Clear and concise cooking directions.

- 🛠️ Dietary Customization – Filters for vegetarian, non-vegetarian,and mixed dietary preferences.

- 💾 Save Favorite Recipes – Bookmark and organize favorite recipes.

- 📱 Responsive UI – Mobile-friendly and easy to navigate.

- 🔥 Firebase Integration – Stores user preferences and saved recipes securely.

## Tech Stack
- **Frontend**: SwiftUI
- **Backend**: Hono.js, Firebase(Firestore, Authentication)
- **AI Model**: Gemini 2.0 Flash
- **Database**: Firestore
- **Authentication**: Firebase AUth (Google, Email, Social Login)
- Deployment: Cloudflare Workers (for backend)

## Project Goals
- Develop a seamless user experience for generating recipes on mobile.
- Optimize AI Query efficiency for fast and accurate recipe results.
- Implement Firebase for user data storage and authentication.
- Ensure UI/UX follows best practices for accessibility and usability.

## Setup Instructions
### Prerequisites
- Xcode
- Firebase account with Firestore enabled
- Google API Key for Gemini 2.0 Flash
- GCP account with billing available

### Installation
**1\. Clone the Repository**
```bash
git clone https://github.com/VineethKumar 2003/Swift_Projects/tree/main/Recipe%20Generator%20using%20Gemini%202.0%20Flash
cd "Recipe Generator using Gemini 2.0 Flash"
```

**2\. Install Dependencies**
```bash
open RecipeRemixer.xcodeproj
```

**3\. Configure Firebase**
- Create a Firebase Project.
- Add the `GoogleService-Info.plist` to the respective directories.
- Enable Firestore and Authentication in Firebase Console.


**4\. Set Up API Keys**
- Obtain a Gemini 2.0 Flash API key from Google Cloud
- Create a `.env` file and add:
```bash
GEMINI_API_KEY=your-api-key
```

**5\. Run the App**
```bash
xcodebuild -scheme RecipeRemixer
```

## Usage Guide
**1. Login/Register** - Use Google or Email Authentication.
**2. Enter the Given Fields** - Input available ingredients.
**3. Generate Recipes** - AI suggests recipes using Gemini 2.0 Flash.
**4. View and Save Recipes** - Save favorite recipes for later.

## API Usage (Gemini 2.0 Flash)
The app sends a request to Gemini AI with a structured JSON payload:
```bash
{
  "preferredCuisine": "Indian",
  "levelOfDifficulty": "Hard",
  "preparationTime": "10 - 540 minutes",
  "mealType": "Snack",
  "dietaryPreference": "Non-Veg"
}
```

## UI/UX Considerations
- Minimalist Design with easy-to-navigate sections.
- Intuitive filtering options for dietary needs.
- Accessible UI for a broad audience.

## Future Enhancements
- Voice input for ingredients entry.
- AI-powered nutrition analysis.
- Image recognition for automatic ingredient detection.
- Chatbot for personlized cooking guidance.

## Contributing
1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`.
3. Commit changes: `git commit -m 'Added new feature'`.
4. Push to the branch: `git push origin feature-name`.
5. Open a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
- Email: vineethkumar212003@gmail.com




