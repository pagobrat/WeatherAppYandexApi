//
//  WeatherTVC.swift
//  PortfolioWeatherApp
//
//  Created by Anton Pogorelov on 19.05.2021.
//

import UIKit

class WeatherTVC: UITableViewController {

    let emptyCity = Weather()

    var weatherArray = [Weather]()
    let citiesArray = ["Прага", "Брно", "Либерец", "Дечин", "Подебрады"]

    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        addCitiesToArray()

        if weatherArray.isEmpty {
            weatherArray = Array(repeating: emptyCity, count: citiesArray.count)
        }

        addCitiesToArray()

    }

    func addCitiesToArray() {

        getCityWeather(weatherArray: self.citiesArray) { (index, weather) in

            self.weatherArray[index] = weather
            self.weatherArray[index].name = self.citiesArray[index]

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return weatherArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell

//        var weather = Weather()

        let weather = weatherArray[indexPath.row]

        cell.weatherConfig(weather: weather)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeather = weatherArray[indexPath.row]
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        destinationVC.weatherModel = cityWeather
        present(destinationVC, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "show" {
//
//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
//
//            let cityWeather = weatherArray[indexPath.row]
//            let destinationVC = segue.destination as! WeatherViewController
//            destinationVC.weatherModel = cityWeather
//        }
//    }
}

