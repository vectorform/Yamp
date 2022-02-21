# Yamp
Yet Another MVP Pod

# Yamp
Yamp's goal is to make craetion of a new MVP-Centri Project easier overall, by providing the base functionality common in MVP projects.

Created and maintained by Vectorform, LLC.

## Requirements:
- iOS 13.0+
- Xcode 10.0+
- Swift 5+

## Installation
### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:
```bash
$ gem install cocoapods
```

> CocoaPods 1.0.0+ is required to build Texty.
To integrate Yamp into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Yamp'
end
```
Then, run the following command:

```bash
$ pod install
```

### Manually
If you prefer not to use any of the listed dependency managers, you can integrate Texty into your project manually.

## Usage
### Creating Controllers
Most Controller following the MVP pattern will be created in the vein of ViewController, Presenter, and their Interfaces.  (which we usually combine into one file called the "Contract")  https://medium.com/overapp-ios/create-xcode-templates-c968d4b43f7b describes creating and using Xcode Templates.  Xcode templates allow you to build a Template that can be used to create one or more files that follow a pattern, thus speeding up development of like-named files.  (aka creating the controller, presenter, and contract files all named correctly in one go)




For Further Examples, please view the Yamp Example Project included in the repo. 


## License
Yamp is available under the [BSD-3-Clause](https://opensource.org/licenses/BSD-3-Clause) License. See the [LICENSE](LICENSE) file for more info.
