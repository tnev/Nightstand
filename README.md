# UNDER CONSTRUCTION: Nightstand will be documented and ready for use very soon

# Nightstand

[![CI Status](https://img.shields.io/travis/tnev/Nightstand.svg?style=flat)](https://travis-ci.org/tnev/Nightstand)
[![Version](https://img.shields.io/cocoapods/v/Nightstand.svg?style=flat)](https://cocoapods.org/pods/Nightstand)
[![License](https://img.shields.io/cocoapods/l/Nightstand.svg?style=flat)](https://cocoapods.org/pods/Nightstand)
[![Platform](https://img.shields.io/cocoapods/p/Nightstand.svg?style=flat)](https://cocoapods.org/pods/Nightstand)

## What is it?
Nightstand is a convenient way to construct static table views for iOS. It removes the need to implement delegate and datasource methods; just construct your rows and sections, and configure them how you please. Nightstand takes care of the rest. Nightstand allows you use built-in cell types, or custom cell types. You can also use your existing UIViewControllers or UITableViewControllers just by having them conform to the necessary protocol.

## Why use it?
Traditional table view implementations can become unweildy since they require logic to be spread across multiple delegate and data source methods. They also require some cognitive overhead and boilerplate like requiring the developer to explicitly implement cell reuse.

When we work with static tables, it’s much easier to think in terms of **sections** and **rows** rather than in terms of delegate methods and index paths. Nightstand allows you to construct an entire table by just defining a collection of sections and rows, without having to work with delegate or data source methods. This allows you to think more statically about your table views.

## How does it work?
Nightstand’s **Row** type represents a single row within a section. A **Row** can be one of the built in types: **Default, Subtitle, Value1, or Value2**, or a **Row** can be a custom cell type that you define.

A **Row** has a **Model**, some **Actions**, and a **Configuration**.
* A row’s **Model** defines the data that the row will use to populate its views.
	* For example, a **Default** row’s **Model** consists of text and an optional image.
* A row’s **Actions** define what happens when it is selected or (optionally) when its accessory view is selected.
* A row’s **Configuration** defines its style.
	* This is where you can set attributes such as selection type, accessory type, and more.

Nightstand’s **Section** type represents a single section within a table. A **Section** contains a collection of **Row**s and some optional configuration properties.

## How can I use it?

Nightstand is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Nightstand'
```

* Once you’ve defined your **Row**s and **Section**s, you just have to make sure the controller that contains your table view conforms to the **Sectioned** protocol.
	* This is a protocol that requires the conforming class to have an Array of **Sections**s
* Now, just call the default **Sectioned** functions in any of the UITableViewDelegate/DataSource methods that you wish to implement and Nightstand will handle the rest.
* If you're having any trouble, or prefer to just see the code, please refer to the example project.

## How can I report an issue?
* Please report any issues using GitHub Issues

## How can I contribute?
* Please open a Pull Request for any minor fixes or contributions. For any major contributions or ideas, feel free to contact me or open an issue and I'd be happy to discuss it with you.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Tyler Neveldine, tneveldine@gmail.com

## License

Nightstand is available under the MIT license. See the LICENSE file for more info.
