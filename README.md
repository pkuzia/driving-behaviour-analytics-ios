![](Screenshots/DrivingBehaviourAnalyzerTitle1.png)

[WIP] An application created as part of the master's thesis analyzing the user driving style using data from the OBDII interface and Machine Learing Core. 
Driving Behaviour Analyzer consists of two parts:

### Collecting data

Part of the application that collects and analyzes data from ODB II interface while driving a car.
The analyzed data are generated into the CSV file and used to trained the machine learning model in XGBoost library.

### Driving Behaviour Analyzer

Part of the application for the user whose driving style will be analyzed. Data from OBD II interface 
on the test route are are processed and saved in Realm database. Using the trained model and ML Core application
determines what type of drive is user.

## Build and Runtime Requirements
+ Xcode 9.0 or later
+ iOS 9.0 or later
+ macOS v10.10 or later

## Installation

### Setup Cocoapods repository

1. Run `pod install` to correctly setup the Cocoapods dependencies
2. Make sure that you open the project referring to  `*.xcworkspace` in Xcode or AppCode

## Screenshots

![](Screenshots/DrivingBehaviourAnalyzerScreen1.png)
![](Screenshots/DrivingBehaviourAnalyzerScreen2.png)
![](Screenshots/DrivingBehaviourAnalyzerGIF.gif)


## Built With

* [XGBoost](https://xgboost.readthedocs.io/en/latest/)
* [Core ML](https://developer.apple.com/machine-learning/)
* [SwifterSwift]()
* [SwiftLint]()
* [Kingfisher]()
* [SwiftSpinner]()
* [Realm]()
* [RealmSwift]()
* [ObjectMapper+Realm]()
* [Moya]()

