# BoxCat

[![CI Status](http://img.shields.io/travis/dreyhomedev/BoxCat.svg?style=flat)](https://travis-ci.org/dreyhomedev/BoxCat)
[![Version](https://img.shields.io/cocoapods/v/BoxCat.svg?style=flat)](http://cocoapods.org/pods/BoxCat)
[![License](https://img.shields.io/cocoapods/l/BoxCat.svg?style=flat)](http://cocoapods.org/pods/BoxCat)
[![Platform](https://img.shields.io/cocoapods/p/BoxCat.svg?style=flat)](http://cocoapods.org/pods/BoxCat)

*Bundled resource loading made easy*

BoxCat provides an easy interface for loading resources from no matter were they are located in the application bundle. It's able to load resources from main app bundle as well from nested resource bundles and contained frameworks, e.g. Pods that containing images, xib-files and any other types of resources.

### Loading resources from Pods and resource bundles

Its main purpose is to load resources from resource bundles that may be contained in Pods. See [Cocoapods bundled resources](https://guides.cocoapods.org/syntax/podspec.html#resource_bundles) for more info. Thus for the unified interface it's also possible to exchange the iOS SDK solution for lading resources, especially if you plan to move some resources into pods in future. You won't even need to change code for loading the resources.

### Overriding resources

Using BoxCat for loading resources will also enable the possibility to override resources contained in a pod with resources from main bundle. you simply need to include a resource in the main app bundle named the same as the one in the pod or resource bundle and loading it using the default interfaces of BoxCat like `UIImage.named(_:)`.

## How to use

You using Box cat similar to the build in resource loading of the iOS SDK. But instead of using the resource classes initialiser to load the resource you use the interface BoxCat provides.

To load an image resource you simply type.

```swift
let boxCatImage = UIImage.named("my_image")
```

This will search the whole main app bundle for the resource. So if its located in the main app bundle it will just load it from there. If it is contained in a bundle located inside of the main app bundle it will also find it and load it.

BoxCat also provides `SearchOptions` to increase performance in searching for loading resources deeply contained in the main bundle hierarchy. Providing a concrete `Bundle` to the interfaces of BoxCat is also a option to increase the performance loading resources.

## Requirements

* iOS 8+
* Swift 3.0
* Cocoapods

## Installation

BoxCat is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BoxCat", :git => 'https://github.com/dreyhomedev/BoxCat.git'
```

## Example

The contained example shows how to load images from main bundle, a pod containing image resources directly and loading images from a pod containing a resource bundle. You will notice the call is always the same for each case!

You will also notice the use of the `SearchOptions` BoxCat provides. They limit the searching to specific frameworks and (sub)bundles in the app bundle hierarchy. That enhances the loading speed of the resources if you have many pods included that my not contain resources like iOS Frameworks.

// TODO: show how overriding works

## License

BoxCat is available under the MIT license. See the LICENSE file for more info.
