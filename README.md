# TipCalculator_2.0

**Description:**
A comprehensive cryptocurrency application offering news, tip calculation, and coin information.

**Features:**

* **News:** Stay updated with the latest cryptocurrency news.
* **Tip Calculator:** Easily calculate tips for transactions.
* **Coins:** Explore detailed information about various cryptocurrencies.

**Getting Started:**
* Clone the repository:
  ```bash
  git clone [https://github.com/ahmedhalilovic/TipCalculator_2.0.git](https://github.com/ahmedhalilovic/TipCalculator_2.0.git)
  ```
* Open the project in Xcode:
  ```bash
  open testTabBar.xcodeproj
  ```
* Run the app on a simulator or connected device.

**Technology Stack:**
* SwiftUI
* (Other relevant technologies, e.g., networking libraries)

**Project Structure:**
* **ContentView.swift:** Main entry point for the app, handles tab navigation.
* **TipCalculator.swift:** Implements the tip calculation logic and UI.
* **MiningView.swift:** Displays coin information and handles data fetching.
* **[Other view files]**


## Data Source: CoinGecko API

This project leverages the CoinGecko API to fetch real-time cryptocurrency data. CoinGecko is a leading platform providing comprehensive cryptocurrency market information.

### API Endpoint
The project utilizes the following CoinGecko API endpoint to retrieve data for the top 20 cryptocurrencies by market capitalization in Euros:

```
[https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=20&page=1&sparkline=false&locale=en](https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=20&page=1&sparkline=false&locale=en)
```

### Data Usage
The fetched data is used to populate the "Coins" section of the application, displaying information such as:

* Coin name and symbol
* Current price
* Market capitalization rank

### Additional Notes
For more details about the CoinGecko API and its capabilities, please refer to the official documentation:

https://docs.coingecko.com/reference/introduction

**Author:**
Ahmed Halilovic
