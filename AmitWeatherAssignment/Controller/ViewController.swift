//
//  ViewController.swift
//  Weather_Assignment
//
//  Created by Amit on 14/10/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var forcasteImage: UIImageView!
    @IBOutlet weak var rainType: UILabel!
    @IBOutlet weak var dateForcastLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewWind: UIView!
    @IBOutlet weak var viewHumidity: UIView!
    @IBOutlet weak var stackNext3Days: UIStackView!
    
    var weatherData = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
           makeUpUI()
        // Set the delegate of the UITextField to self
        searchTxtField.delegate = self
        // Add a UITapGestureRecognizer to dismiss the keyboard
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGesture)
        
        Spinner.start()
            self.getCurrentWeather(for: "Delhi" ?? "No matching location found") { result in
                Spinner.stop()
                       switch result {
                       case .success(let weatherData):
                           print(weatherData)
                       case .failure(let error):
                           // Handle error, display an error message to the user
                           print("Error fetching weather: \(error)")
                    }
        }

    }
    
    func makeUpUI(){
        mainView.layer.cornerRadius = 24
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.white.cgColor
        viewWind.layer.borderWidth = 1
        viewWind.layer.borderColor = UIColor.white.cgColor
        viewHumidity.layer.borderWidth = 1
        viewHumidity.layer.borderColor = UIColor.white.cgColor
        viewHumidity.layer.cornerRadius = 24
        viewHumidity.layer.maskedCorners = [.layerMaxXMaxYCorner]
        viewHumidity.layer.masksToBounds = true
        searchTxtField.layer.borderWidth = 2
        searchTxtField.layer.borderColor = UIColor.gray.cgColor
        searchTxtField.layer.cornerRadius = 4
        viewWind.layer.cornerRadius = 24
        viewWind.layer.maskedCorners = [.layerMinXMaxYCorner]
        viewWind.layer.masksToBounds = true
        stackNext3Days.layer.cornerRadius = 12
        stackNext3Days.layer.masksToBounds = true
        stackNext3Days.clipsToBounds = true
    }
    
    
    func trimWhitespaces(from inputString: String) -> String {
        return inputString.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    @objc func dismissKeyboard() {
           // This will dismiss the keyboard for the active text field (if any)
           view.endEditing(true)
       }
    
    
    
    @IBAction func searchBtnAction(_ sender: Any) {
        Spinner.start()
            self.getCurrentWeather(for: self.searchTxtField.text ?? "No matching location found") { result in
                Spinner.stop()
                self.searchTxtField.resignFirstResponder()
                       switch result {
                       case .success(let weatherData):
                           print(weatherData)
                       case .failure(let error):
                           // Handle error, display an error message to the user
                           print("Error fetching weather: \(error)")
                    }
        }
       
    }
    
    
    @IBAction func nextDaysBtnAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NextFourDaysVC") as! NextFourDaysVC
        vc.currentCity = cityLbl.text ?? ""
        self.navigationController?.present(vc, animated: true)
    }
}



extension ViewController{
    //MARK:  Api call for featch weater details
        func getCurrentWeather(for city: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
            guard let url = URL(string: "\(NetworkAccess.currentbaseURL)?key=\(NetworkAccess.apiKey)&q=\(city)") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        let dataWeather = try JSONDecoder().decode(WeatherData.self, from: data)
                        DispatchQueue.main.async {
                            self.cityLbl.text = "\(dataWeather.location?.name ?? "No matching location found")"
                            self.stateLbl.text = dataWeather.location?.region
                            self.degreeLbl.text = "\(dataWeather.current?.temp_c ?? 0)°C"
                            self.rainType.text = dataWeather.current?.condition?.text
//                            self.dateForcastLbl.text = dataWeather.location?.localtime
                            self.dateForcastLbl.text = self.formatDate(dataWeather.location?.localtime ?? "")
                            
                            self.windLbl.text = "\(dataWeather.current?.wind_kph ?? 0) KPH"
                            self.humidityLbl.text = "\(dataWeather.current?.humidity ?? 0) g.m-3"
                            self.forcasteImage.image = UIImage(named: String(dataWeather.current?.condition?.code ?? 1000))
                            
                            completion(.success(dataWeather))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    
    
//    MARK: convert date format dd MMM YYYY
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let inputDate = dateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "dd MMM YYYY"
            return outputDateFormatter.string(from: inputDate)
        }
        return "Invalid Date"
    }
}
