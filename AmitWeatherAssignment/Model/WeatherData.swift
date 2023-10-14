//
//  WeatherData.swift
//  Weather_Assignment
//
//  Created by Amit on 14/10/23.
//

import Foundation
struct WeatherData : Codable {
    let location : Location?
    let current : Current?
    
    enum CodingKeys: String, CodingKey {
        
        case location = "location"
        case current = "current"
    }
}
struct Location : Codable {
    let name : String?
    let region : String?
    let country : String?
    let lat : Double?
    let lon : Double?
    let tz_id : String?
    let localtime_epoch : Int?
    let localtime : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tz_id = "tz_id"
        case localtime_epoch = "localtime_epoch"
        case localtime = "localtime"
    }
}
struct Current : Codable {
    let last_updated_epoch : Int?
    let last_updated : String?
    let temp_c : Double?
    let temp_f : Double?
    let is_day : Int?
    let condition : Condition?
    let wind_mph : Double?
    let wind_kph : Double?
    let wind_degree : Int?
    let wind_dir : String?
    let pressure_mb : Double?
    let pressure_in : Double?
    let precip_mm : Double?
    let precip_in : Double?
    let humidity : Int?
    let cloud : Int?
    let feelslike_c : Double?
    let feelslike_f : Double?
    let vis_km : Double?
    let vis_miles : Double?
    let uv : Double?
    let gust_mph : Double?
    let gust_kph : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case last_updated_epoch = "last_updated_epoch"
        case last_updated = "last_updated"
        case temp_c = "temp_c"
        case temp_f = "temp_f"
        case is_day = "is_day"
        case condition = "condition"
        case wind_mph = "wind_mph"
        case wind_kph = "wind_kph"
        case wind_degree = "wind_degree"
        case wind_dir = "wind_dir"
        case pressure_mb = "pressure_mb"
        case pressure_in = "pressure_in"
        case precip_mm = "precip_mm"
        case precip_in = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslike_c = "feelslike_c"
        case feelslike_f = "feelslike_f"
        case vis_km = "vis_km"
        case vis_miles = "vis_miles"
        case uv = "uv"
        case gust_mph = "gust_mph"
        case gust_kph = "gust_kph"
    }
    
}
struct Condition : Codable {
    let text : String?
    let icon : String?
    let code : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case text = "text"
        case icon = "icon"
        case code = "code"
    }
}

   

