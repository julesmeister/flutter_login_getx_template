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
- Copy google-services to /android/app folder
- Need to add <code> await Firebase.initializeApp();</code> in main() if platform is Android
- Firebase plugins should be added in pubspec.yaml
- Move google-services.json to android/app/ folder
- Do this <code>git rm --cached android/app/google-services.json</code> if you have pushed the google-services.json to Github. And don't forget to .gitignore it, <code>git rm --cached android/app/google-services.json</code>

## Unique Features
- Opens a drawer without using an app bar.

   <codeblock>
   
      var scaffoldKey = GlobalKey<ScaffoldState>();

      Scaffold(
      key: scaffoldKey


      // Use this on your button

      scaffoldKey.currentState.openDrawer();
   </codeblock>