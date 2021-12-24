

import Foundation
class ApiHandler {
    static let shared = ApiHandler()
    
    private init() {}
    
    func getStockPrices()->[Weather]{
        if let url = URL(string:"https://api.weatherapi.com/v1/current.json?key=9d3f80f4bff84508b9d110237212412&q=Surat&aqi=no"){
            do{
                let data = try Data(contentsOf: url)
                print(data)
                do {
                    let json = try JSONDecoder().decode(Weather.self, from: data)
                    print(json)
                    return [json]
                }catch{
                    print(error)
                }
            }catch{
                print("error")
            }
            }
        return [Weather]()
        }
}

