//
//  ViewController.swift
//  Clima
//
//  Created by Bárbara 14/04/2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WheatherManager()
//  let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   /*   locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        locationManager.delegate = self */
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    
    @IBAction func seachPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    //Este método implementado do UITextFieldDelegate, ele pergunta ViewController: "O usuário pressionou a tecla de enter do teclado o que devemos fazer?"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    //Este método é para avisar a viewController que o usuário não interagiu com o campo de texto e aperteu um enter, ele avisa ao usuário que ele deve editar, deve escrever algo ali.
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    //Este método nativo ele avisa a ViewController: "O usuário acabou de editar o campo de texto?" Assim que o usuário acabar de digitar, editar ele limpará o campo de texto
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
        weatherManager.fetchWeather(cityName: city)
    }
        searchTextField.text = " "
  }
    
}


//MARK: - WeatherManagerDelegate


extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WheatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
     print(error)
    }
}

/*
//MARK: -  CLLocationManagerDelegate


extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       print("Got location data")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
*/
