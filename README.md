#NYTArticles

This is a simple application which downloads the NY Times Most Popular Articles API and shows a list of articles. Also shows a detail screen when when the list items are tapped.

##How to run the project

The project dependencies can be installed via Bundler:

```
bundler
```

This helps new members to install dependencies quickly. Currently we only use cocoapods as dependency but in a project with CI we'd have more dependency, like fastlane for example.

Run pod install to download third party libraries:

```
pod install
```

After this you're good to go, open the `NYTArticles.xcworkspace` file in Xcode and run the project.

##Features

###Multiple schemes

Every scheme has it's own role in the development process. In this project every scheme has different bundle identifier which is useful because this way the user can install multiple environments to his phone simultaneously. Also each scheme has a product name prefix so we can differentiate the apps. This setup is also useful because this way the in-house beta build analytics and crashes are separated from the production application's data in Fabric.

**Dev:** This is the scheme used for development. In a big application this scheme would connect to the development server.

**Mock:** In a real-world situation this scheme does not use server connection but uses pre-defined mock data and displays it in the UI. This scheme is handy if you have to develop UI interfaces and also can be used to run UI tests.

**Production:** Connects to the production server.
