//
//  RajaOngkirAPI.swift
//  CekOngkir
//
//  Created by Indra Permana on 28/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//

import Foundation

class RajaOngkirAPI: ProvincesStoreProtocol, CitiesStoreProtocol {
    
    private let baseUrl = "https://api.rajaongkir.com/starter/"
    private let headers = ["key": "0df6d5bf733214af6c6644eb8717c92c"]
    static var provinces: [Province] = []
    static var cities: [City] = []
    
    // MARK: ProvincesStoreProtocol
    func fetchProvinces(completionHandler: @escaping (() throws -> [Province]) -> Void) {
        print("Start Request Province")
        let request = NSMutableURLRequest(url: URL(string: baseUrl+"province")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error ?? "")
          } else {
            guard let responsData = data, response != nil else { print("Something Wrong")
                return
            }
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse!)
            let decoder = JSONDecoder()
            do {
                let downloadedProvince = try decoder.decode(RajaOngkirProvince.self, from: responsData)
                let provinces = downloadedProvince.rajaongkir.results
//                print("PROVINCES ARE \(provinces)")
                type(of: self).provinces = provinces
                completionHandler { return type(of: self).provinces }
            } catch {
                print(error)
            }
          }
        })

        dataTask.resume()
    }
    
    func fetchProvince(id: String, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    func createProvince(provinceToCreate: Province, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    func updateProvince(ProvinceToUpdate: Province, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    func deleteProvince(id: String, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    
    // MARK: CitiesStoreProtocol
    func fetchCities(completionHandler: @escaping (() throws -> [City]) -> Void) {
        print("Start Request Province")
        let request = NSMutableURLRequest(url: URL(string: baseUrl+"city")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error ?? "")
          } else {
            guard let responsData = data, response != nil else { print("Something Wrong")
                return
            }
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse!)
            let decoder = JSONDecoder()
            do {
                let downloadedCities = try decoder.decode(RajaOngkirCity.self, from: responsData)
                let cities = downloadedCities.rajaongkir.results
//                print("CITIES ARE \(cities)")
                type(of: self).cities = cities
                completionHandler { return type(of: self).cities }
            } catch {
                print(error)
            }
          }
        })

        dataTask.resume()
    }
    
    func fetchCities(id: String, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
    
    func createCities(citiesToCreate: City, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
    
    func updateCities(citiesToUpdate: City, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
    
    func deleteCities(id: String, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
    
    
}
