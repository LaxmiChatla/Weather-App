//
//  ViewController.swift
//  Weather App
//
//  Created by Laxmi Chandrashekhar Chatla on 08/11/23.
//

import UIKit

class ViewController: UIViewController {
    //2f44ace5f84946a698a154300230811
    @IBOutlet var UpdatetimeLabel_txt: UILabel!
    
    @IBOutlet var Region_txt: UILabel!
    
    @IBOutlet var County_txt: UILabel!
    
    @IBOutlet var Temp_txt: UILabel!
    
    @IBOutlet var Wind_txt: UILabel!
    
    @IBOutlet var Humidity_txt: UILabel!
    
    @IBOutlet var Refresh_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Refresh_btn.layer.cornerRadius=5
        
        fetchData()
        
    }

    func fetchData(){
        let url = URL(string:
                        "https://api.weatherapi.com/v1/current.json?key=f6a3bd73743647c78a071746230911&q=India&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!,completionHandler: {
            (data,response,error) in
            guard let data = data, error == nil else{
                print("Error Occured While Accessing Data with URL")
                return
            }
            var fullWeatherData:WeatherData?
            do
            {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }
            catch
            {
                print("Error Occured While Decoding JSON into Swift Structure\(error)")
            }
            
            DispatchQueue.main.async {
                
                self.UpdatetimeLabel_txt.text="Update:\(fullWeatherData!.current.last_updated)"
                self.Region_txt.text="Region:\(fullWeatherData!.location.region)"
                self.County_txt.text="County:\(fullWeatherData!.location.country)"
                self.Wind_txt.text="Wind(Km/Hr):\(fullWeatherData!.current.wind_kph)"
                self.Humidity_txt.text="Humidity:\(fullWeatherData!.current.humidity)"
                self.Temp_txt.text="Temprature(Celsius):\(fullWeatherData!.current.temp_c)"
            }
        })
        
        dataTask.resume()
    }
    
    @IBAction func refreshData(_ sender: Any) {
        self.fetchData()
    }
    
}

