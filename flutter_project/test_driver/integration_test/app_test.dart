import "package:flutter_driver/flutter_driver.dart";
import "package:test/test.dart";

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

    test("leave from start page", () async {
      await Future.delayed(Duration(seconds:10));
      await driver.tap(image);
      //this adds extra delay to better show the process;
      await Future.delayed(Duration(seconds:5));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds:5));
      assert(find.text("Login") != null);
    });

  });
}