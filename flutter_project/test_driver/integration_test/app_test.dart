@Timeout(Duration(seconds: 120))
import "package:flutter_driver/flutter_driver.dart";
import "package:test/test.dart";

//Please make sure your local database is up to date and it is correctly connected.
//Before run 'flutter drive --target=lib/integration_test/app.dart' in terminal, please make sure an emulator or actual device is connected.
//please make sure the last user ID in datebase is odd.
void main() {
  group("A.I.D app test",() {
    FlutterDriver driver;
    
    setUpAll(()async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll((){
      if(driver != null) {
        driver.close();
      }
    });

    var image = find.byValueKey("imageToTap");

    test("Minus Mood test", () async {
      await Future.delayed(Duration(seconds:10));
      await driver.tap(image);
      //this adds extra delay to better show the process;
      await Future.delayed(Duration(seconds:5));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds:5));
      assert(find.text("Login") != null);
      var signUp = find.byValueKey("SignUpButton");
      assert(signUp != null);
      print("before tap signup");
      await driver.tap(signUp);
      await driver.waitUntilNoTransientCallbacks();
      print("after tap signup");
      await Future.delayed(Duration(seconds:5));
      assert(find.text("Login") == null);
      var textField = find.byValueKey('EmailTextField');
      await driver.tap(textField); 
      await Future.delayed(Duration(seconds:1));
      await driver.enterText('123@kcl.ac.uk'); 
      await Future.delayed(Duration(seconds:1));
      assert(find.text("123@kcl.ac.uk") == null);
      await driver.waitFor(find.text('123@kcl.ac.uk'));
      textField = find.byValueKey('PasswordTextField');
      await Future.delayed(Duration(seconds:1));
      await driver.tap(textField);
      await Future.delayed(Duration(seconds:1)); 
      await driver.enterText('123456'); 
      await Future.delayed(Duration(seconds:3)); 
      var signUpButton = find.byValueKey("SignUpButton");
      await driver.tap(signUpButton);
      print("Please remember your ID and restore the database before this user is createdif you want to proceed!!!");
      await Future.delayed(Duration(seconds:10));
      var nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      var text = find.byValueKey("Practice1TextField");
      await driver.tap(text);
      await Future.delayed(Duration(seconds:1));
      await driver.enterText('i'); 
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      var noButton = find.text("No");
      assert(nextButton != null);
      await driver.tap(noButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      var socialButton = find.text("Social");
      assert(socialButton != null);
      await driver.tap(socialButton);
      await Future.delayed(Duration(seconds:2));
      var acaButton = find.text("Academic");
      assert(acaButton != null);
      await driver.tap(acaButton);
      await Future.delayed(Duration(seconds:2));
      var hobbieButton = find.text("Hobbies");
      assert(hobbieButton != null);
      await driver.tap(hobbieButton);
      await Future.delayed(Duration(seconds:2));
      var workButton = find.text("Work");
      assert(workButton != null);
      await driver.tap(workButton);
      await Future.delayed(Duration(seconds:2));
      var familyButton = find.text("Family");
      assert(familyButton != null);
      await driver.tap(familyButton);
      await Future.delayed(Duration(seconds:2));
      var relationButton = find.text("Relationships");
      assert(relationButton != null);
      await driver.tap(relationButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      var saveButton = find.text("Save");
      assert(saveButton != null);
      await driver.tap(saveButton);
      await Future.delayed(Duration(seconds:2));
      var startButton = find.text("Start");
      assert(startButton != null);
      await driver.tap(startButton);
      await Future.delayed(Duration(seconds:2));
      var beginButton = find.text("Let's begin!");
      assert(beginButton != null);
      await driver.tap(beginButton);
      await Future.delayed(Duration(seconds:2));
      var firstImageButton = find.byValueKey("firstImageRadio");
      assert(firstImageButton != null);
      await driver.tap(firstImageButton);
      await Future.delayed(Duration(seconds:2));
      var secondImageButton = find.byValueKey("secondImageRadio");
      assert(secondImageButton != null);
      await driver.tap(secondImageButton);
      await Future.delayed(Duration(seconds:2));
      var thirdImageButton = find.byValueKey("thirdImageRadio");
      assert(thirdImageButton != null);
      await driver.tap(thirdImageButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      text = find.byValueKey("item1TextField");
      await driver.tap(text);
      await Future.delayed(Duration(seconds:1));
      await driver.enterText('l'); 
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      noButton = find.text("No");
      assert(nextButton != null);
      await driver.tap(noButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
      nextButton = find.text("Next");
      assert(nextButton != null);
      await driver.tap(nextButton);
      await Future.delayed(Duration(seconds:2));
    },timeout:Timeout.none);

  });
}