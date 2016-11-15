# ASProgressHud

[![CI Status](http://img.shields.io/travis/Andrea/ASProgressHud.svg?style=flat)](https://travis-ci.org/Andrea/ASProgressHud)
[![Version](https://img.shields.io/cocoapods/v/ASProgressHud.svg?style=flat)](http://cocoapods.org/pods/ASProgressHud)
[![License](https://img.shields.io/cocoapods/l/ASProgressHud.svg?style=flat)](http://cocoapods.org/pods/ASProgressHud)
[![Platform](https://img.shields.io/cocoapods/p/ASProgressHud.svg?style=flat)](http://cocoapods.org/pods/ASProgressHud)

## Requirements

* Swift 3.0
* XCode 8.0
* iOS >= 8

## Installation

ASProgressHud is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ASProgressHud"
```

## Changelog
See the [changelog](CHANGELOG.md) file. 


## Description
ASProgressHud displays a customized loading view. The loader is created with an UIImageView animated with png images.

![Screenshot](preview.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Default HUD

```swift
// Show
ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .default)

// Hide
ASProgressHud.hideHUDForView(self.view, animated: true)
```

#### Custom HUD

```swift
// Import loader images in png format, with name like loader\_custom\_00.png, loader\_custom\_01.png, etc...

// Create HudProperty
HudProperty(prefixName: "loader_custom", frameNumber: 18)

// Show
ASProgressHud.showCustomHUDAddedTo(self.view, animated: true, hudProperty: hudProperty)

// Hide
ASProgressHud.hideHUDForView(self.view, animated: true)
```

## Resources

* [Preloaders.net](http://preloaders.net/)
* [Gif and aPng splitter](http://animizer.net/en/gif-apng-splitter)

## Author

Andrea, Twitter @andrea_steva

## License

ASProgressHud is available under the MIT license. See the LICENSE file for more info.

