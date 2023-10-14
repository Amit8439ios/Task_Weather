//
//  NextFourDaysData.swift
//  Weather_Assignment
//
//  Created by Amit on 14/10/23.
//

import Foundation

struct NextFourDaysData : Codable {
    let location : Location4?
    let current : Current4?
    let forecast : Forecast?
    
    enum CodingKeys: String, CodingKey {
        
        case location = "location"
        case current = "current"
        case forecast = "forecast"
    }
}
struct Location4 : Codable {
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
struct Current4 : Codable {
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
struct Forecast : Codable {
    let forecastday : [Forecastday]?
    
    enum CodingKeys: String, CodingKey {
        
        case forecastday = "forecastday"
    }
}
struct Forecastday : Codable {
    let date : String?
    let date_epoch : Int?
    let day : Day?
    let astro : Astro?
    let hour : [Hour]?
    
    enum CodingKeys: String, CodingKey {
        
        case date = "date"
        case date_epoch = "date_epoch"
        case day = "day"
        case astro = "astro"
        case hour = "hour"
    }
}
struct Day : Codable {
    let maxtemp_c : Double?
    let maxtemp_f : Double?
    let mintemp_c : Double?
    let mintemp_f : Double?
    let avgtemp_c : Double?
    let avgtemp_f : Double?
    let maxwind_mph : Double?
    let maxwind_kph : Double?
    let totalprecip_mm : Double?
    let totalprecip_in : Double?
    let totalsnow_cm : Double?
    let avgvis_km : Double?
    let avgvis_miles : Double?
    let avghumidity : Double?
    let daily_will_it_rain : Int?
    let daily_chance_of_rain : Int?
    let daily_will_it_snow : Int?
    let daily_chance_of_snow : Int?
    let condition : Condition?
    let uv : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case maxtemp_c = "maxtemp_c"
        case maxtemp_f = "maxtemp_f"
        case mintemp_c = "mintemp_c"
        case mintemp_f = "mintemp_f"
        case avgtemp_c = "avgtemp_c"
        case avgtemp_f = "avgtemp_f"
        case maxwind_mph = "maxwind_mph"
        case maxwind_kph = "maxwind_kph"
        case totalprecip_mm = "totalprecip_mm"
        case totalprecip_in = "totalprecip_in"
        case totalsnow_cm = "totalsnow_cm"
        case avgvis_km = "avgvis_km"
        case avgvis_miles = "avgvis_miles"
        case avghumidity = "avghumidity"
        case daily_will_it_rain = "daily_will_it_rain"
        case daily_chance_of_rain = "daily_chance_of_rain"
        case daily_will_it_snow = "daily_will_it_snow"
        case daily_chance_of_snow = "daily_chance_of_snow"
        case condition = "condition"
        case uv = "uv"
    }
}
struct Astro : Codable {
    let sunrise : String?
    let sunset : String?
    let moonrise : String?
    let moonset : String?
    let moon_phase : String?
    let moon_illumination : String?
    let is_moon_up : Int?
    let is_sun_up : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moon_phase = "moon_phase"
        case moon_illumination = "moon_illumination"
        case is_moon_up = "is_moon_up"
        case is_sun_up = "is_sun_up"
    }
}
struct Hour : Codable {
    let time_epoch : Int?
    let time : String?
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
    let windchill_c : Double?
    let windchill_f : Double?
    let heatindex_c : Double?
    let heatindex_f : Double?
    let dewpoint_c : Double?
    let dewpoint_f : Double?
    let will_it_rain : Int?
    let chance_of_rain : Int?
    let will_it_snow : Int?
    let chance_of_snow : Int?
    let vis_km : Double?
    let vis_miles : Double?
    let gust_mph : Double?
    let gust_kph : Double?
    let uv : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case time_epoch = "time_epoch"
        case time = "time"
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
        case windchill_c = "windchill_c"
        case windchill_f = "windchill_f"
        case heatindex_c = "heatindex_c"
        case heatindex_f = "heatindex_f"
        case dewpoint_c = "dewpoint_c"
        case dewpoint_f = "dewpoint_f"
        case will_it_rain = "will_it_rain"
        case chance_of_rain = "chance_of_rain"
        case will_it_snow = "will_it_snow"
        case chance_of_snow = "chance_of_snow"
        case vis_km = "vis_km"
        case vis_miles = "vis_miles"
        case gust_mph = "gust_mph"
        case gust_kph = "gust_kph"
        case uv = "uv"
    }
}
