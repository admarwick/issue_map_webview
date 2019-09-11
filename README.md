# issue_map_webview

Illustrates an issue that occurs in Release Mode on IOS when from 
a page containing a GoogleMap widget (google_maps_flutter)
a second page is pushed that contains a WebView (webview_flutter). 

The issue is that a white screen is shown when returning to the GoogleMap page from the
WebView page, if the app has been paused from the WebView page,
then resumed.

## Steps to Reproduce

- Merge this repo into a fresh Flutter project.
- Add the needed google map keys to ios/Runner/AppDelegate.swift and
android/app/src/main/AndroidManifest.xml
- Run the app on IOS in Release Mode.
- Navigate to the second page by pressing the button.
- Press the iPhone "Home" button to pause the app, then return to the 
running app.
- Use the back button on the second page's app bar. Instead of returning
to the first page, a white screen is shown.


