//
//  ListCell.swift
//  PortfolioWeatherApp
//
//  Created by Anton Pogorelov on 23.05.2021.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!

    func weatherConfig(weather: Weather) {
        self.cityLabel.text = weather.name
        self.weatherLabel.text = weather.conditionString
    }
}
