# avengers

Packages **
test -> Unit test
build_runner -> Unit test
mockito -> Unit test
flutter_launcher_icons -> Generate app icon for all sizes(both Android/iOS)
shared_preferences -> Used to hold token data
provider -> State management
http -> http client for api


Assets **
images *
-logo.png // Splash and app icon made with image taken from the Flying Donkey IT's LinkedIn account.
App icon made with flutter_launcher_icons package.
The splash screen was made with the router.

        -placeholder.jpg // Added as placeholder for images in user list.


Login Process **
lib **
view_model *
login_vm // In order not to get an error, I sent the registered user on the test api to the service.
Negative scenario wrote in unit test.
I submitted the sample data as it only accepts a single user in the test api.


test **
login_test // I prepared two different scenarios, one positive and one negative.
Positive is login with registered account, the return value will be the token.
Negative is login without registered account, the return value will be null.
I made use of mockito, the Dart Team's own test kit.

    login_test.mock // Auto generated http client dart file for test.
