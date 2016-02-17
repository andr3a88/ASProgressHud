# ASProgressHud

[![CI Status](http://img.shields.io/travis/Andrea/ASProgressHud.svg?style=flat)](https://travis-ci.org/Andrea/ASProgressHud)
[![Version](https://img.shields.io/cocoapods/v/ASProgressHud.svg?style=flat)](http://cocoapods.org/pods/ASProgressHud)
[![License](https://img.shields.io/cocoapods/l/ASProgressHud.svg?style=flat)](http://cocoapods.org/pods/ASProgressHud)
[![Platform](https://img.shields.io/cocoapods/p/ASProgressHud.svg?style=flat)](http://cocoapods.org/pods/ASProgressHud)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ASProgressHud is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ASProgressHud"
```

## Author

Andrea, runner_corsa@msn.com

## License

ASProgressHud is available under the MIT license. See the LICENSE file for more info.


# ERProgressHudExample 
####Version 1.0 - 22-07-2015 - Andrea Stevanato 


##DESCRIPTION
ERProgressHud (Swift Version): displays a customized loading view. The loader is created with an UIImageView animated by images in png format (30 fps)

##HOW TO USE
* Import ERProgressHud
* **Default loader**
* Choose a ```ERProgressHudType```
* Create Loader:  ```ERProgressHud.showHUDAddedTo(self.view, animated: true, type: ERProgressHudType.Slhash)```
* **Custom loader**
* Import loader images in png format, with name like loader\_custom\_00.png, loader\_custom\_01.png, etc...
* Create HudProperty: ```HudProperty(prefixName: "loader_custom", frameNumber: 18, backgroundColor: UIColor.clearColor())```
* Create Loader:  ```ERProgressHud.showCustomHUDAddedTo(self.view, animated: true, hudProperty: hudProperty)```
* **Hide loader**: ```ERProgressHud.hideHUDForView(self.view, animated: true)```


## RESOURCES

* [Preloaders.net](http://preloaders.net/)
* [Gif and aPng splitter](http://animizer.net/en/gif-apng-splitter)
