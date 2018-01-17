# Motivation

WordPress had been one of the most popular open-source CRM in the world. Wouldn't it be great if it can be used as a backend for your app? On top of WordPress, you have

1. **One** database, for both your website and app
1. **Dashboard** to manage data, no more need to develop a custom a Management Portal
1. **Reduced** time and cost

Since the release of [4.7 Vauhan](https://wordpress.org/news/2016/12/vaughan/) in Dec 2016, WordPress comes with **[REST API endpoints](https://developer.wordpress.org/rest-api/reference/)** for posts, comments, terms, users, meta, and settings.

This means **by default**, any **WordPress** 4.7+ instance can now be used as a **BAAS** for your app.

REST API is already a well-received standard in developer communities, many excellent native lib exists for native apps to consume REST API, such as [Alamofire](https://github.com/Alamofire/Alamofire) & [Retrofit](https://github.com/square/retrofit). 

However the experience of writing raw API calls it is just not elegant enough for our coding taste. And this is exactly what WPAPI is:

Written in native **Swift 4**, WPAPI is a **mobile SDK** which allows iOS apps to use yyour WordPress 4.7+ website as a Backend.

# Development

This is an alpha version of the SDK, and is **NOT** recommended to be used in production.

1. [Milestones](docs/milestones.md)
1. [Progress](docs/progress.md)
1. [Documentation](docs/README.md)

A more comprehensive REST API documentation can be found at [WordPress.org Handbook](https://developer.wordpress.org/rest-api/)

# WPAPI

[![CI Status](http://img.shields.io/travis/SK8-PTY-LTD/WPAPI.svg?style=flat)](https://travis-ci.org/SK8-PTY-LTD/WPAPI_iOS)
[![Version](https://img.shields.io/cocoapods/v/WPAPI.svg?style=flat)](http://cocoapods.org/pods/WPAPI)
[![License](https://img.shields.io/cocoapods/l/WPAPI.svg?style=flat)](http://cocoapods.org/pods/WPAPI)
[![Platform](https://img.shields.io/cocoapods/p/WPAPI.svg?style=flat)](http://cocoapods.org/pods/WPAPI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

1. Xcode 9
2. Swift 4
3. iOS 10.0+

## Installation

WPAPI is available through [CocoaPods](http://cocoapods.org) and [Github](https://github.com/SK8-PTY-LTD/WPAPI_iOS). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WPAPI'
```

# Open Source

## Contributing

Pull requests for new features, bug fixes, and suggestions are welcome!
For more information on [iOS App Development] and [WordPress Web Development](https://sk8.tech/services/web-design), please [Contact Us](https://sk8.tech/contact-us)

## Author

[Jack Song](https://github.com/jacktator)

# Legal

## Copyright

Copyright © 2013-2018 [SK8 PTY LTD](https://sk8.tech)
hi@sk8.tech

## License

WPAPI is available under the MIT license. See the LICENSE file for more info.
