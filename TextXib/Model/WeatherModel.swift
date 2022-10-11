//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Zaggle on 10/10/22.
//

import Foundation

struct WeatherModel{
    let conditionId:Int
    let cityName:String
    let temperature:Double
    var tempString:String{
        return String(format: "%.1f", temperature)
    }
    
    var conditonName: String{
        switch conditionId{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}
