# pixelfield

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# pixelfield_flutter

## Pixelfield Test Task



📱 Features Implemented
Collection screen,
Collection Details screen,
Offline-first data handling,
Mock JSON integration,
Clean architecture BLoC pattern for state management,
Authentication validation and design implement,
Welcome screen,
Responsive layout (basic),
Git version control



**🕒 Time Tracking**

| task                                              | time spent(in hour) |
|:--------------------------------------------------|:-------------------:|
| project setup and folder structure                |         0.5         | 
| UI implementation (Collection + Detail)           |          4          | 
| State management (BLoC setup & integration)       |         2.5         | 
| Offline & mock JSON logic                         |         1.5         | 
| Code cleanup and testing                          |          1          | 
| Welcome screen                                    |          1          | 
| Home screen                                       |         0.5         | 
| Authentication validation and design implement    |         1.5         | 
| Code cleanup and testing                          |          1          | 
| Animation (button animation, navigated animation) |         2.5         | 
| Native launcher implementation                    |         1.5         | 
| README, Git commits, final touches                |         0.5         | 
| total                                             |         18          | 


**📦 Packages Used**

| Package                 |                                                                                                                             Reason                                                                                                                             |
|:------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| google_fonts            |                               # The app design relies heavily on Lato and EB Garamond, so I used this package to easily apply those fonts across the UI.#I'm also comfortable working with any unique or custom fonts as needed                                | 
| simple_animations       |                                               # To enhance user experience, I used simple animations—for example, a subtle tap animation on buttons.#  It helps make the app feel smoother and more interactive.                                               | 
| video_player            |                                               #This was used to play a video on the "Testing Node" section inside the collection detail screen.#It’s reliable and works well for basic embedded video playback .                                               | 
| flutter_bloc            |                                                 # I followed the Clean Architecture pattern and# used flutter_bloc for state management to maintain a clean separation between presentation and business logic                                                 | 
| json_annotation:        |                                                                               #Helps in generating boilerplate code for parsing JSON, making model handling easier and cleaner.                                                                                | 
| json_annotation: ^4.9.0 |                                                                          # Used for value-based comparisons of state and event classes, which is important for state updates in BLoC.                                                                          | 
| dartz                   |                                                              # I used dartz to handle Success/Error states cleanly using Either<L, R> types, which fits well within a Clean Architecture approach                                                              | 
| get_it                  |                                                                         #This is used for dependency injection—allowing me to decouple dependencies and make the app easier to manage.                                                                         | 
| cached_network_image    |                                                              #Used to efficiently load and cache network images, reducing flickering and speeding up the UI rendering especially on repeat loads.                                                              | 
| connectivity_plus       |                                                                 #Helps me detect internet connectivity status. I use it to decide when to fetch fresh data or rely on locally cached content.                                                                  | 
| hive_flutter            | #I use Hive to store fetched data locally, so the app can display previously loaded content even when offline. #You can test this by running the app first without internet, then connect to fetch data—it gets saved and works even when you go offline again | 



**🛠️ How to Run**

`flutter pub get`
`flutter run`


![Alt text](https://github.com/HemKumarRai/pixelfield_flutter/blob/master/Screenshot%202025-04-16%20at%2009.40.38.png?raw=true)
~~~~Make sure you’re using the latest stable version of Flutter.~~~~




