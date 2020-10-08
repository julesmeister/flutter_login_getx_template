# flutter_login_getx_template

Utilising Firebase to login and register user using text fields and maybe even add social plugins

## References
Firebase Auth w/ GetX: 
- https://www.youtube.com/watch?v=-H-T_BSgfOE

UI: 

1. https://www.youtube.com/watch?v=P2IGQT3BZQo
   - Login Stacked UI

2. https://www.youtube.com/watch?v=Y6xAQVXkhLA
   - Github: https://github.com/retroportalstudio/rps_ui_collection
   - BorderIcon, OptionButton, constant values

## Devices
Web
 - Need to add dependencies into index.html for Firebase plugins
 - Need to add Firebase SDK Snippet to index.html which initializes Firebase instead of doing it inside main()

Android
- Need to add <code> await Firebase.initializeApp();</code> in main() if platform is Android
- Firebase plugins will be added in pubspec.yaml