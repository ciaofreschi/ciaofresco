## Entities

- User web-app

Responsive web-app available to everyone with a browser and an internet connection

## Actors

- **Guest User**: the user without an account
- **User**: the user that is already registered in the platform


## Use cases

### Guest User

| ID       | Function                       | Short description                                                                                                                                                                 | 
|----------|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GU1**  | Sign up                        | The user can insert First name, Last Name, E-mail, Password and Confirm Password. Then, by clicking on "SignUp", and checking the terms and conditions box the account is created |
| **GU2**  | Change location                | Allows users to set their current location or preferred location for better recipe recommendations based on region-specific cuisines                                              |
| **GU3**  | Check recipes for a given week | Users can view a list of recipes curated for the week, helping with meal planning                                                                                                 |
| **GU4**  | Change week                    | Users can navigate between different weeks to see past or upcoming weekly recipe recommendations                                                                                  |
| **GU5**  | Search recipes                 | Allows users to search for specific recipes based on keywords or ingredients                                                                                                      |
| **GU6**  | Filter recipes                 | Users can apply filters (e.g. cuisine, preparation time, dietary restrictions) to the recipe list to narrow down their choices                                                    |
| **GU7**  | Download recipe                | Users can download a specific recipe in a user-friendly format (e.g., PDF) for offline access                                                                                     |
| **GU8**  | View recipe detail             | Detailed view of a recipe, including ingredients, steps, preparation time, serving size, and user reviews                                                                         |
| **GU9**  | Open settings                  | Provides access to various app settings like theme, language, privacy settings, etc                                                                                               |
| **GU10** | Change theme                   | Users can toggle between light and dark mode, or select other thematic designs                                                                                                    |
| **GU11** | Change language                | Lets users switch the app language from a list of supported languages                                                                                                             |
| **GU12** | Open Privacy Policy            | Shows the detailed privacy policy, informing users how their data is used, stored, and protected                                                                                  |
| **GU13** | Open Terms & Conditions        | Displays the platform's terms and conditions which users must agree to during sign-up                                                                                             |


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

## Platform Characteristics
The platform is going to be a PWA, responsive using cutting edge web frameworks and technologies.
It supports multiple languages.
The system will be cloud based.

TDB

## Third part systems
Descrizione di tutti i sistemi terzi utilizzati (ad es. stripe)
