//
//  WeatherViewController.swift
//  PortfolioWeatherApp
//
//  Created by Anton Pogorelov on 23.05.2021.
//

import UIKit
import SwiftSVG

class WeatherViewController: UIViewController {

    var weatherModel: Weather?

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabels()
    }

    func updateLabels() {
        cityLabel.text = weatherModel?.name
        weatherLabel.text = weatherModel?.conditionString
        temperatureLabel.text = "\((weatherModel?.temperature)!)"

        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(weatherModel!.weatherIcon).svg")

        let weatherImage = UIView(SVGURL: url!) {(image) in
            image.resizeToFit(self.cityView.bounds)
        }
        self.cityView.addSubview(weatherImage)
    }
}
