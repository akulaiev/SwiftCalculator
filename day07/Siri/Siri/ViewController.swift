//
//  ViewController.swift
//  Siri
//
//  Created by Anna Kulaieva on 10/10/19.
//  Copyright © 2019 Anna Kulaieva. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var requestButton: UIButton!
    
    let greet: [String] = ["Hi!", "Hello!", "Nice to meet you!", "It's great to see you here!", "Aloha!"]
    let bye: [String] = ["Bye!", "See you soon!", "Already leaving?", "Come back soon!", "Ciao!"]
    
    var bot: RecastAIClient?
    var weatherClient: DarkSkyClient?
    let myBotToken: String = "79041156ad82db40296bb8fc4e5d15a3"
    let myWeatherToken: String = "d25940e235c3a07f181cb63eb3e119d8"
    var locationManager = CLLocationManager()
    var resultStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bot = RecastAIClient(token : myBotToken, language: "en")
        self.weatherClient = DarkSkyClient(apiKey: myWeatherToken)
        self.weatherClient?.language = .english
        self.requestButton.layer.cornerRadius = 15
        self.outputLabel.layer.cornerRadius = 15
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func getWeather(response: Response) -> String {
        var requestTime: Date?
        var requestLocation: CLLocationCoordinate2D?
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let location = response.get(entity: "location") {
            let latitude: Double = Double(truncating: location["lat"]! as! NSNumber)
            let longitude: Double = Double(truncating: location["lng"]! as! NSNumber)
            requestLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        else {
            guard let location: CLLocationCoordinate2D = locationManager.location?.coordinate else { return "Error" }
            requestLocation = location
        }
        if let dateTime = response.get(entity: "datetime") {
            let time = dateTime["iso"] as! String
            requestTime = formatter.date(from: time)
        }
        else {
            requestTime = Date()
        }
        weatherClient!.getForecast(location: requestLocation!, time: requestTime!) { res in
            switch res {
            case .success(let forecast, _):
                if let fTemp: Double = forecast.currently?.apparentTemperature {
                    let cTemp = Int((fTemp - 32) * (5 / 9))
                    self.resultStr = String(cTemp)
                }
            case .failure(let error):
                self.resultStr = error.localizedDescription
            }
        }
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: requestTime!)
    }
    
    @IBAction func makeRequest(_ sender: UIButton) {
        if let input = inputTextField.text {
            if !input.isEmpty && !input.trimmingCharacters(in: .whitespaces).isEmpty {
                bot?.textRequest(input, successHandler: { (response) in
                    let intents = response.intents!
                    if intents.count != 0 {
                        let indx: Int = Int.random(in: 0...4)
                        if intents[0].description.contains("weather") {
                            let date: String = self.getWeather(response: response)
                            if let res = self.resultStr {
                                self.outputLabel.textColor = .black
                                self.outputLabel.textAlignment = .center
                                self.outputLabel.text! = "The temperature for " + date + " is: " + res + "°C"
                            }
                        }
                        else if intents[0].description == "greetings" {
                            self.outputLabel.text! = self.greet[indx]
                        }
                        else if intents[0].description == "goodbye" {
                            self.outputLabel.text! = self.bye[indx]
                        }
                        else {
                            self.outputLabel.text! = "Error"
                        }
                    }
                    else {
                        self.outputLabel.text! = "Error"
                    }
                },
                failureHandle: { (error) in
                    self.outputLabel.text! = error.localizedDescription
                })
            }
            else {
                print("Empty input!")
            }
        }
    }
}
