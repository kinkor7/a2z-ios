# How to Run MODIChat iOS in Xcode

Since iOS apps require a Mac with Xcode to compile, follow these steps to bring the source code to life.

## Step 1: Create a New Project
1. Open **Xcode** and select **Create a new Xcode project**.
2. Select **iOS** $\rightarrow$ **App**.
3. **Project Details**:
   - Product Name: `A2ZInternational`
   - Organization Identifier: `com.a2z.international`
   - Interface: **SwiftUI**
   - Language: **Swift**
4. Save the project in a folder of your choice.

## Step 2: Import the Source Code
Copy the following files from the `/Users/ag700/Downloads/RE/a2z_ios` folder into your Xcode project:
- `A2ZTheme.swift` (For branding and colors)
- `DashboardView.swift` (The main navigation hub)
- `CareerAssistantView.swift` (The interactive chatbot)
- `A2ZInternationalApp.swift` (The main app entry point)

## Step 3: Configure App Settings
1. In the **Project Navigator**, select the project target.
2. Go to the **Info** tab.
3. Add a new key: `LSApplicationQueriesSchemes` (Array).
4. Add an item to this array: `whatsapp`.
   *This allows the app to check if WhatsApp is installed and open it directly.*

## Step 4: Run the App
1. Select your preferred simulator (e.g., iPhone 15) from the top menu.
2. Press **Cmd + R** to build and run.

## Feature Overview
- **Modern SwiftUI**: Uses the latest declarative UI for a lightweight and fast experience.
- **Branding**: Implements the official A2Z Dark Blue and Gold palette.
- **WhatsApp Integration**: The Career Assistant collects user data and prepares a professional formatted message for direct WhatsApp submission.
