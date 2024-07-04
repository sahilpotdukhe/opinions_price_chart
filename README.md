<!-- Project Title -->

<h1 align="center">Opinion Price Chart</h1>


## 🔰 Project Overview
Opinion Price Chart is a Flutter application that displays real-time price data fetched from Firestore and visualizes it using Syncfusion Flutter Charts.


---
## ➤ Key Features

- Real-time price updates fetched from Firestore.
- Line chart visualization using Syncfusion Flutter Charts.
- Start/Stop timer functionality to control data updates.


---
## 🛠 Technologies and Frameworks Used
- <img src="https://user-images.githubusercontent.com/25181517/186150365-da1eccce-6201-487c-8649-45e9e99435fd.png" alt="Flutter" width="20" height="20"> Flutter Framework (Dart language)
- <img src="readmeimages/bloclogo.png" alt="Bloc" width="20" height="20"> Bloc (for state management)



## ⚡Usage/Examples

```javascript
static Widget buildChart(BuildContext context, List<PriceData> priceHistory) {
    if (priceHistory.isEmpty) {
      return const Center(child: Text('No data available'));
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 18, 18),
      child: SfCartesianChart(
        plotAreaBackgroundColor: Colors.white,
        primaryXAxis: NumericAxis(
          title: AxisTitle(
              text: 'Time(sec)',
              textStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          interval: 10,
          minimum: 0,
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
              text: 'Price (₹)',
              textStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ),
        series: <ChartSeries>[
          SplineSeries<PriceData, double>(
            dataSource: priceHistory,
            xValueMapper: (PriceData time, _) =>
            priceHistory.indexOf(time).toDouble() * 10,
            yValueMapper: (PriceData price, _) =>
                price.price.round().toDouble(),
            color: Colors.green,
            width: 3,
            opacity: 0.7,
            markerSettings: const MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: Colors.green,
              borderWidth: 2,
              borderColor: Colors.green,
            ),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
          SplineAreaSeries<PriceData, double>(
            dataSource: priceHistory,
            xValueMapper: (PriceData time, _) =>
            priceHistory.indexOf(time).toDouble() * 10,
            yValueMapper: (PriceData price, _) =>
                price.price.round().toDouble(),
            color: Colors.green.withOpacity(0.3),
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          zoomMode: ZoomMode.xy,
          enablePanning: true,
        ),
      ),
    );
  }
.............
}
```

## 🚀 Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/sahilpotdukhe/opinions_price_chart.git
2. **Navigate to the project directory:**
    ```bash
    cd opinions_chart
3. **Install dependencies:**
    ```bash
    flutter pub get
4. **Run the app:**
    ```bash
    flutter run

## 📋 Requirements

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)

---
## ➤ Contact
You can reach out to me via the following methods:

- **Email:**  <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Gmail.svg" alt="Gmail" width="20" height="20">&nbsp;&nbsp;<a href="mailto:sahilpotdukhe.ssp@gmail.com">sahilpotdukhe.ssp@gmail.com
- **Social Media:**
   - <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Linkedin.svg" alt="Linkedin" width="20" height="20">&nbsp;&nbsp;[LinkedIn](https://www.linkedin.com/in/sahil-potdukhe/)
   - <img src="https://w7.pngwing.com/pngs/914/758/png-transparent-github-social-media-computer-icons-logo-android-github-logo-computer-wallpaper-banner-thumbnail.png" alt="Github" width="20" height="20">&nbsp;&nbsp;[GitHub](https://github.com/sahilpotdukhe)
   - <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Instagram.svg" alt="Instagram" width="20" height="20">&nbsp;&nbsp;[Instagram](https://www.instagram.com/sahilpotdukhe11/)
   - <img src="https://github.com/SatYu26/SatYu26/blob/master/Assets/Twitter.svg" alt="Twitter" width="20" height="20">&nbsp;&nbsp;[Twitter](https://twitter.com/SahilPotdukhe)
  ---


