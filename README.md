# NYTArticles

This is a simple application which downloads the NY Times Most Popular Articles API and shows a list of articles. Also shows a detail screen when the list items are tapped.

Although it's a simple app I tried to demonstrate a more robust architecture which I'd use in a large scale application. You can read about the features and some improvement ideas below.

## How to run the project

The project tool dependencies can be installed via Bundler in terminal:

```
bundler
```

This helps new members to install tool dependencies quickly. Currently we only use cocoapods but in a project with CI we'd have more dependency (fastlane for example).

Run pod install to download third party libraries:

```
pod install
```

After this you're good to go, open the `NYTArticles.xcworkspace` file in Xcode and run the project.

## Features

### Multiple schemes

Every scheme has it's own role in the development process. In this project every scheme has different bundle identifier which is useful because this way the user can install multiple environments to his phone simultaneously. Also each scheme has a product name prefix so we can differentiate the apps when all of them installed. This setup is also useful because this way the in-house beta build analytics and crashes are separated from the production application's data in Fabric.

**Dev:** This is the scheme used for development. In a big application this scheme would connect to the development server.

**Mock:** In a real-world situation this scheme does not use server connection but uses pre-defined mock data and displays it in the UI. This scheme is handy if you have to develop UI interfaces and also can be used to run UI tests.

**Production:** Connects to the production server.

### Separated application layers

When I created the app my goal was to aim for an architecture which is suitable for a whole team.

Different screens / screen groups can be found in different folders for the sake of better navigation in the project structure.

## Improvement ideas

### Dependency injection

To every screen we should inject the data manager instances and navigator objects with dependency injection. We should use lazy initialisation here which means that the instance of a class is initialised only when it's used for the first time. With this approach the application would start faster because the dependency injection system does not instantiates every unnecessary class when the application starts.

### Tests

In the mock environment we can write UI tests which is handy to test if there's no crash in the application. Also with UI tests it's very easy to make sure that form validations are working correctly (if we have any) and the submit button only becomes active if all the necessary criteria is met.

In mock environment we can also increase the system animation speed which could speed up the UI tests a bit.

Also we could write unit tests to test client side logic and integration tests. Integration tests are good to make sure that for a certain JSON input our datamanager layer generates correct output and it works fine.

### Navigator

In this project I only used `self.navigationController` to navigate between screens but it would be a better practice to implement a navigator object. The navigator instance would be injected to every screen. It would use some ID parameter which would identify a screen and also a parameter object which will be passed to the new screen. The navigator would instantiate the ViewController which we want and would pass the parameter object to it. This is how I'd pass parameter between screens.

### Clean up data manager implementation

In this project I mapped server response objects to view model objects in the data manager layer. In large project this would decrease the readability of the data manager. It would be a better practice to move the mapping to a response model category.

### Components

For now I used a ViewController for every screen and every behaviour can be found there.

In large projects we usually implement smaller components. Components are views with some inner logic and every screen can contain multiple components inside a scroll view.

### CI server

Even for smaller applications it's recommended to set up a CI server. I'd use Jenkins with Fastlane and Danger.

Some CI server feature ideas:

* MR job which would run after every merge request. It would check the code style, would run the tests we have and would check if every required information is available in the MR description (Jira ticket ID or attached video or screenshot for example).
* Release job which could send in-house and distribution releases to Fabric and TestFlight.

### Remove NSLog calls

It's not recommended to use NSLog in production applications, all NSLog should be changed to a logging system where we can set the log level and use descriptive logging only for development or debug environments.
