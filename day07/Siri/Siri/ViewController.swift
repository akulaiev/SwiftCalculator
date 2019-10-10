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
    
    let greet: [String] = ["Hi!", "Hello!", "Nice to meet you!", "It's great to see you here!", "Aloha!"]
    let bye: [String] = ["Bye!", "See you soon!", "Already leaving?", "Come back soon!", "Ciao!"]
    
    var bot: RecastAIClient?
    var weatherClient: DarkSkyClient?
    let myBotToken: String = "79041156ad82db40296bb8fc4e5d15a3"
    let myWeatherToken: String = "d25940e235c3a07f181cb63eb3e119d8"
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bot = RecastAIClient(token : myBotToken, language: "en")
        self.weatherClient = DarkSkyClient(apiKey: myWeatherToken)
        self.weatherClient?.language = .english
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func getWeather(response: Response) -> String {
        var result: String = ""
        if let location = response.get(entity: "location") {
            let latitude: Double = Double(truncating: location["lat"]! as! NSNumber)
            let longitude: Double = Double(truncating: location["lng"]! as! NSNumber)
        }
        else {
            guard let location: CLLocationCoordinate2D = locationManager.location?.coordinate else { return result}
        }
        if let dateTime = response.get(entity: "datetime") {
            let timeStr: String = dateTime["iso"] as! String
        }
        else {
            print("here")
            let dateTime = Date()
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
            print(formatter.string(from: dateTime))
        }
//        weatherClient?.getForecast(location: <#T##CLLocationCoordinate2D#>, time: <#T##Date#>, completion: <#T##(Result<(Forecast, RequestMetadata), Error>) -> Void#>)
        return result
    }
    
    @IBAction func makeRequest(_ sender: UIButton) {
        if let input = inputTextField.text {
            if !input.isEmpty && !input.trimmingCharacters(in: .whitespaces).isEmpty {
                bot?.textRequest(input, successHandler: { (response) in
                    let intents = response.intents!
                    if intents.count != 0 {
                        let indx: Int = Int.random(in: 0...4)
                        if intents[0].description.contains("weather") {
                            self.outputLabel.text! = self.getWeather(response: response)
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
