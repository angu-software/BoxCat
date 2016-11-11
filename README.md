# BoxCat

[![CI Status](http://img.shields.io/travis/devdrey/BoxCat.svg?style=flat)](https://travis-ci.org/devdrey/BoxCat)
[![Version](https://img.shields.io/cocoapods/v/BoxCat.svg?style=flat)](http://cocoapods.org/pods/BoxCat)
[![License](https://img.shields.io/cocoapods/l/BoxCat.svg?style=flat)](http://cocoapods.org/pods/BoxCat)
[![Platform](https://img.shields.io/cocoapods/p/BoxCat.svg?style=flat)](http://cocoapods.org/pods/BoxCat)
[![codecov](https://codecov.io/gh/devdrey/BoxCat/branch/develop/graph/badge.svg)](https://codecov.io/gh/devdrey/BoxCat)

*Bundled resource loading made easy*

_BoxCat_ provides an easy interface for loading resources from no matter were they are located in the application bundle. It's able to load resources from main app bundle as well from nested resource bundles and contained frameworks, e.g. Pods that containing images, xib-files and any other types of resources.

### Loading resources from Pods and resource bundles

Its main purpose is to load resources from resource bundles that may be contained in Pods. See [Cocoapods bundled resources](https://guides.cocoapods.org/syntax/podspec.html#resource_bundles) for more info. Thus for the unified interface it's also possible to exchange the iOS SDK solution for lading resources, especially if you plan to move some resources into pods in future. You won't even need to change code for loading the resources.

### Overriding resources

Using _BoxCat_ for loading resources will also enable the possibility to override resources contained in a pod with resources from main bundle. You simply need to include a resource in the main app bundle named the same as the one in the pod or resource bundle and loading it using the default interfaces of _BoxCat_ like `UIImage.named(_:)`.

## How to use

You using Box cat similar to the build in resource loading of the iOS SDK. But instead of using the resource classes initialiser to load the resource you use the interface _BoxCat_ provides.

To load an image resource you simply type.

```swift
let boxCatImage = UIImage.named("my_image")
```

This will search the whole main app bundle for the resource. So if its located in the main app bundle it will just load it from there. If it is contained in a bundle located inside of the main app bundle it will also find it and load it.

_BoxCat_ also provides `LookupFilter` to increase performance in searching for loading resources deeply contained in the main bundle hierarchy. Providing a concrete `Bundle` to the interfaces of _BoxCat_ is also a option to increase the performance loading resources.

You can specify those `LookupFilter` globally or locally only affecting a single resource loading call.

```swift
// Set lookup filter globally
// These lookup filter will be used for every resource loading call
let lookupFilter = lookupFilter(frameworks: ["GlobalResources"], 
                                bundles: ["Images"])
BoxCat.lookupFilter = lookupFilter
        
//...

// Set specific lookup filter at the resource loading call
// Overriding the globally set lookup filter
UIImage.named("bg_launch", lookupFilter: LookupFilter(frameworks: ["GlobalResources"], bundles: ["BigImages"]))

```

## Requirements

* iOS 8+
* Swift 3.0
* Cocoapods

## Installation

_BoxCat_ is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BoxCat", :git => 'https://github.com/dreyhomedev/BoxCat.git'
```

## Example

The contained example shows how to load images from main bundle, a pod containing image resources directly and loading images from a pod containing a resource bundle. You will notice the call is always the same for each case!

You will also notice the use of the `LookupFilter` _BoxCat_ provides. They limit the searching to specific frameworks and (sub)bundles in the app bundle hierarchy. That enhances the loading speed of the resources if you have many pods included that my not contain resources like iOS Frameworks.

## License

_BoxCat_ is available under the MIT license. See the LICENSE file for more info.
