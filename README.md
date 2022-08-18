# BitPrice

<img src="https://github.com/PhilomathMac/BitPrice/blob/main/PortfolioImage.png?raw=true" alt="BitPrice Icon" width="200"/>


## Description
iOS app that displays the current worth of a bitcoin in different world currencies

## Skills Practiced

* Autolayout and constraints
* Dark Mode
* Protocol/Delegate Pattern
* Use APIs
* HTTP Requests
* JSON Encoding/Decoding
* Grand Central Dispatch
* Organizing Code via Extensions
* MVC Pattern

## Future Features / Fixes
* Show a graph of historical data for that currency conversion
* Round the corners on dataView in light mode
* Format large numbers to be more readable
* Include symbols for each currency

## Use Instructions

This app involves using an external API. To use the app, clone the project and add your own API key.

1. Create an account with [CoinAPI](https://www.coinapi.io)
2. Copy your own API key
3. In the app project, create a Constants struct.
4. Store your API key in a type property of the Constants struct titled apiKey.

```swift
struct Constants {
  static let apiKey = "Insert your API key here"
}

```

Now the app should function normally.

## Attributions

This was developed using ideas from The App Brewery's Complete App Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)
