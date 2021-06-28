//
//  CitiesLocation.swift
//  PortfolioWeatherApp
//
//  Created by Anton Pogorelov on 23.05.2021.
//

import Foundation
import CoreLocation

let networkManager = NetworkManager()

func getCityWeather(weatherArray: [String], completionHandler: @escaping(Int, Weather) -> Void) {

    for (index, item) in weatherArray.enumerated() {
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else { return }

            networkManager.getWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                completionHandler(index, weather)
            }
        }
    }
}

func getCoordinateFrom(city: String, complition: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        complition(placemark?.first?.location?.coordinate, error)
    }
}
