//
//  WeatherData .swift
//  Weather App
//
//  Created by Laxmi Chandrashekhar Chatla on 08/11/23.
//

import Foundation
struct WeatherData:Codable
{
    let location:LocationData
    let current:CurrentData 
}
