## Entities

- User web-app

Responsive web-app available to everyone with a browser and an internet connection

## Actors

- **Guest User**: the user without an account
- **User**: the user that is already registered in the platform


## Use cases

### Guest User

| ID       | Function                       | Short description                                                                                                                                                             | 
|----------|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GU1**  | Sign up                        | The user can insert First name, Last Name, E-mail, Password and Confirm Password. Then, by clicking on "SignUp", and checking the terms and conditions box the account is created |
| **GU2**  | Change location                | Allows users to set their current location for better recipe recommendations based on region-specific cuisines                                              |
| **GU3**  | Check recipes for a given week | Users can view a list of recipes curated for the week, helping with meal planning                                                                                             |
| **GU4**  | Change week                    | Users can navigate between different weeks to see past or upcoming weekly recipe recommendations                                                                              |
| **GU5**  | Search recipes                 | Allows users to search for specific recipes based on keywords or ingredients                                                                                                  |
| **GU6**  | Filter recipes                 | Users can apply filters (e.g. cuisine, preparation time, dietary restrictions) to the recipe list to narrow down their choices                                                |
| **GU7**  | Download recipe                | Users can download a specific recipe in a user-friendly format (e.g., PDF) for offline access                                                                                 |
| **GU8**  | View recipe detail             | Detailed view of a recipe, including ingredients, steps, preparation time, serving size, and user reviews                                                                     |
| **GU9**  | Open settings                  | Provides access to various app settings like theme, language, privacy settings, etc                                                                                           |
| **GU10** | Change theme                   | Users can toggle between light and dark mode, or select other thematic designs                                                                                                |
| **GU11** | Open Privacy Policy            | Shows the detailed privacy policy, informing users how their data is used, stored, and protected                                                                              |
| **GU12** | Open Terms & Conditions        | Displays the platform's terms and conditions which users must agree to during sign-up                                                                                         |

#### GU4 - Change week

1. The guest opens the app and lands on the main recipe recommendation screen.
2. They spot a section indicating the currently selected week for recipe recommendations.
3. Below or adjacent to the current week indicator, they find navigation buttons or arrows labeled "Previous Week" and "Next Week."
4. The user clicks on "Previous Week" to view recipes curated for the past week. Conversely, they can click on "Next Week" to peek into upcoming weekly recipe suggestions.
5. The list of recipes refreshes, reflecting the selection for the chosen week.

_Note: The app may limit how many weeks back or ahead users can navigate._

#### GU5 - Search recipes

1. From the main screen or a dedicated search screen, the user finds a search bar or magnifying glass icon.
2. They click into the search bar and are presented with an on-screen keyboard.
3. As they type in keywords or ingredients, the app may suggest popular or relevant searches in a dropdown.
4. After inputting their search criteria, the user presses the "Search" or "Enter" button on the keyboard.
5. The app displays a list of recipes that match the search criteria, each with a brief overview and an option to view in detail.
6. If no matches are found, the app provides a message such as "No recipes found for your search. Try different keywords."

_Note: Search accuracy improves with more specific or unique keywords._

#### GU6 - Filter recipes

1. The guest lands on the main recipe listing or a search results page.
2. They spot a "Filter" or "Refine" button, icon, or section.
3. Upon selecting this, a modal or sidebar opens with multiple filtering options like cuisine type, preparation time, dietary restrictions, etc.
4. The user selects one or more filters according to their preferences.
5. There's a "Apply Filters" or "Show Results" button at the bottom of the modal or sidebar. The user clicks it.
6. The list of recipes updates, showing only those that match the applied filters.
7. The user has the option to clear or modify filters to adjust their search further.

_Note: Multiple filters can be combined for a more refined search._

#### GU7 - Download recipe

1. The guest user navigates to a specific recipe detail page they're interested in.
2. Detailed information about the recipe, like ingredients, preparation steps, and serving size, is presented.
3. The user notices a "Download" button or icon
4. Upon clicking this, they're given format options like PDF
5. The user selects their preferred format and confirms the download.
6. The app processes the request and the recipe begins downloading. Depending on the device and settings, the user might be asked where to save the file.
7. Once downloaded, the user can access the recipe offline from the saved location.

_Note: Some recipes might come with high-resolution images, leading to larger file sizes._



### User
All the Guest user functionalities, including:

| ID      | Function                      | Short description                                                                                                       | 
|---------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **U1**  | Sign in                       | If the user has already an account, can insert E-mail and Password to authenticate. If not, he must be sign up (**U1**) |
| **U2**  | Sign in / Sign up with Google | The user can use their Google Account to authenticate.                                                                  |
| **U3**  | Sign in / Sign up with Apple  | The user can use their Apple Account to authenticate.                                                                   |
| **U4**  | Forgot password               | Provides users with steps to recover or reset their password in case they forget it                                     |
| **U5**  | Logout                        | Lets the user securely log out from the platform                                                                        |
| **U6**  | Delete account                | Allows users to permanently delete their account, removing all associated data                                          |
| **U7**  | Insert review                 | Users can write and post reviews for recipes, providing feedback, and ratings                                           |
| **U8**  | Edit review                   | Allows users to modify their previously posted reviews                                                                  |
| **U9**  | Delete review                 | Lets users remove any review they've posted                                                                             |
| **U10** | Insert variant                | Users can suggest variations or modifications to existing recipes                                                       |
| **U10** | Insert recipe to favorites    | Allows users to add a particular recipe to their favorites list for quick access                                        |
| **U10** | Remove recipe from favorites  | Lets users remove recipes from their favorites list                                                                     |
| **U11** | Like a variant                | Users can 'like' or 'upvote' a suggested recipe variant to show appreciation or agreement                               |
| **U11** | Unlike a variant              | Allows users to 'unlike' or 'remove upvote' from a suggested recipe variant                                             |
| **U12** | Like a review                 | Users can 'like' or 'upvote' a review to show appreciation or agreement                                                 |
| **U13** | Unlike a review               | Allows users to 'unlike' or 'remove upvote' from a review                                                               |


#### U1 - Sign up
1. The user opens the app
2. The user accesses in the Sign-up screen
3. The user fills the fields below:
   - First name
   - Last name
   - E-mail
   - Password
   - Confirm password
4. The user accepts the Terms & Conditions.
5. The user clicks on "Sign Up" button to register their account.

_Note: Password and Confirm Password must be the same_

#### U7 - Insert review

1. The user navigates to the recipe details page for a particular recipe.
2. The user scrolls down to the "Reviews" section.
3. The user clicks on the "Write a Review" button.
4. A form or modal appears, prompting the user to rate the recipe (e.g., out of 5 stars), provide textual feedback and upload images.
5. The user selects a rating, types their review in the provided text field and uploads some pics (optional).
6. The user clicks on the "Submit" button to post the review.

_Note: The review cannot be submitted without both a rating and textual feedback._

_Note: The review must be approved after a validation process by the administrators._


#### U8 - Edit review

1. The user navigates to the recipe details page where they've previously posted a review.
2. The user finds their review under the "Reviews" section.
3. The user clicks on the "Edit" button/icon next to their review.
4. A form or modal appears, pre-filled with the user's previous rating, images and textual feedback.
5. The user modifies the rating, the textual feedback, or both and can upload/delete images.
6. The user clicks on the "Update" button to save the changes.

_Note: The review cannot be updated without both a rating and textual feedback._

_Note: The modification must be accepted after a validation process by the administrators._

#### U9 - Delete review

1. The user navigates to the recipe details page where they've previously posted a review.
2. The user finds their review under the "Reviews" section.
3. The user clicks on the "Delete" button/icon next to their review.
4. A confirmation prompt appears, asking the user if they're sure about deleting the review.
5. The user confirms by clicking on "Yes, Delete".
6. The review is removed from the list.

_Note: This action is irreversible._

_Note: The deletion is possible within a time range (e.g. within 10 hour of publication)._

#### U10 - Insert variant

1. The user navigates to the recipe details page for a particular recipe.
2. The user scrolls down to the "Variants" or "Recipe Modifications" section.
3. The user clicks on the "Suggest a Variant" button.
4. A form or modal appears, prompting the user to describe the variant, e.g., ingredient swaps, cooking methods, etc.
5. The user fills in the details of their suggested variant.
6. The user clicks on the "Submit" button to post the variant.

_Note: The variant description must be provided._


## Platform Characteristics
The platform is going to be a PWA, responsive using cutting edge web frameworks and technologies.
It supports multiple languages.
The system will be cloud based.

TDB

## Third part systems
Descrizione di tutti i sistemi terzi utilizzati (ad es. stripe)
