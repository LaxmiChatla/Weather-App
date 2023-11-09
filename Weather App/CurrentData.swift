//
//  CurrentData.swift
//  Weather App
//
//  Created by Laxmi Chandrashekhar Chatla on 08/11/23.
//

import Foundation

struct CurrentData:Codable
{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
}
