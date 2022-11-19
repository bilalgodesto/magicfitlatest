# Pre-requisites
- Install your IDE of choice - Android Studio or Visual Studio Code
- Install Flutter SDK for your OS
- Met Flutter platform dependencies by running "flutter doctor" command
- Clone this folder from github or download the zip file
- Open this folder in any code editor 
- Run the command in terminal in the root of this folder `flutter pub get`
- Project is setup and we are ready to perfom testing
- All the test scripts are written in `test` folder in the root.
- Run the command in terminal in the root of this project folder `flutter test test/workout_controller_test.dart`
  
  This command will run the `test` which is in `test\workout_controller_test.dart` 
  all the test in this file `workout_controller_test.dart` will be run and output will be shown in terminal 


# TYPES OF TEST [FLUTTER] 
1) Unit test
2) Widget test
3) Integration test

To perform these test we have created some files in this project folder

# PROJECT STRUCTURE [UNIT] TESTING

- in lib/services folder we have define workout_controller.dart which contains a function saveWorkoutTest which will return
  add or update depends on parameters.
  we will be using this file for [1st] type of testing i.e unit testing.
- To perform unit testing we have created workout_controller_test.dart file in
  test folder.
- To [unit] test any function in workout_controller_test.dart we have used test() function
- test function requires two paramters i.e description and callback function
- callback function perform the test and show output in terminal
- To combine two different test() functions we use the group function provided by flutter_test 
- Run the following command 
  `flutter test test/workout_controller_test.dart` to run the test the workout_controller_test.dart

  
# PROJECT STRUCTURE [WIDGET] TESTING
 
- in lib folder we have define dashboard.dart which contains two button  i.e add new and view listing
  we tap the add new button button and check if the add new workout form is open.
  we tap the view listing button and check if the view listing page is open.
  we will be using this file for [2nd] type of testing i.e widget testing.
  
- To perform widget testing we have created dashboard_widget_test.dart file in
  test folder.

- To [widget] test any function in dashboard.dart we have used testWidgets() function
  
- test function requires two paramters i.e description and callback function
  
- callback function perform the test and show output in terminal
  



# PROJECT STRUCTURE [INTEGRATION] TESTING

- in lib folder we have define three files. all these files will be used in integration testing

 During testing we will access dashboard.dart and tap the add new button 
 we will open the form. Select the dropdown values and tap the save button.
 Then we verify that all the items are added in the provider. We will then
 delete one item from list and verify that item is deleted successfully.


 we will be using these files for [3rd] type of testing i.e integration testing.
  
- To perform integration testing we have added below code in pubspec.yaml under dev_dependencies
  integration_test:
    sdk: flutter

- We have created a folder integration_test
- inside that folder we have created app_test.dart. This file will contain all 
  test which will be a part of our integration test.
- To run the test we need to run this command `flutter test integration_test/app_test.dart`
  in terminal in the root of the project.
- If multiple devices are connected and we run this command we need to select the emulator/simulator
  where we want to run the test.
- Integration test actually run on device and simulate all the test steps

- In app_test.dart file we have to define the main function.
- We call function IntegrationTestWidgetsFlutterBinding.ensureInitialized(); to initialize the integration testing
- We define group function which requires two parameters i.e description and callback functions.
- All test functions are defined inside the callback function.


# General points for testing in flutter 

- In any flutter project to enable testing add the following lines in pubsec.yaml 
  under dev_dependencies

 flutter_test:
    sdk: flutter
