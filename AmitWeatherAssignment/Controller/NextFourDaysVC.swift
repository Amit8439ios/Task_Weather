//
//  NextFourDaysVC.swift
//  Weather_Assignment
//
//  Created by Amit on 14/10/23.
//

import UIKit

class NextFourDaysVC: UIViewController {

    
    @IBOutlet weak var fourDayLbl: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    var currentCity:String?
    var nextFourDaysData = [Forecastday]()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           myTableView.delegate = self
           myTableView.dataSource = self
        fourDayLbl.text = "\(currentCity ?? "")'s Weather."
           // Call the API to fetch weather data for the next four day
        Spinner.start()
           getCurrentWeather(for: currentCity ?? "agra") { result in
               Spinner.stop()
               switch result {
               case .success(let data):
                   // Handle the successful retrieval of weather data
                   self.nextFourDaysData = data.first?.forecast?.forecastday ?? [] // Update your data array with the parsed data
                   DispatchQueue.main.async{
                       self.myTableView.reloadData() // Refresh the table view with the new data
                   }
               case .failure(let error):
                   // Handle the error
                   print("Error fetching weather data: \(error)")
               }
           }
       }

       func getCurrentWeather(for city: String?, completion: @escaping (Result<[NextFourDaysData], Error>) -> Void) {
           guard let city = city,
                 let url = URL(string: "\(NetworkAccess.nextFourDaysBaseURL)?key=\(NetworkAccess.apiKey)&q=\(city)&days=4") else {
               completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
               return
           }
           URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   completion(.failure(error))
                   return
               }

               if let data = data {
//                   print(data)
                   do {
                       let decoder = JSONDecoder()
                       let weatherData = try decoder.decode(NextFourDaysData.self, from: data)
                       
                       completion(.success([weatherData]))
                       
                   } catch {
                       completion(.failure(error))
                   }
               }
           }.resume()
       }
   }

   extension NextFourDaysVC: UITableViewDelegate, UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
           return nextFourDaysData.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
               cell.dateLbl.text = nextFourDaysData[indexPath.row].date ?? "nil"
               cell.degreeLbl.text = "\(nextFourDaysData[indexPath.row].day?.mintemp_c ?? 0)°C / \(nextFourDaysData[indexPath.row].day?.maxtemp_c ?? 0)°C"
               cell.icon.image = UIImage(named: String(nextFourDaysData[indexPath.row].day?.condition?.code ?? 1000))
           
         
           return cell
       }

       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60
       }
   }
