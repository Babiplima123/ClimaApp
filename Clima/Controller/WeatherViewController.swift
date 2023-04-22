//
//  ViewController.swift
//  Clima
//
//  Created by Bárbara 14/04/2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WheatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func seachPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    //Este método nativo ele pergunta ViewController: "O usuário pressionou a tecla de enter do teclado o que devemos fazer?"
    
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

