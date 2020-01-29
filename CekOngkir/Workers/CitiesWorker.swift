//
//  CitiesWorker.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//

import UIKit

class CitiesWorker {
    var citiesStore: CitiesStoreProtocol
    
    init(citiesStore: CitiesStoreProtocol) {
        self.citiesStore = citiesStore
    }
    
    func doSomeWork() {
    }
    
    func fetchCities(completionHandler: @escaping ([City]) -> Void) {
      citiesStore.fetchCities { (Cities: () throws -> [City]) -> Void in
        do {
          let cities = try Cities()
          DispatchQueue.main.async {
            completionHandler(cities)
          }
        } catch {
          DispatchQueue.main.async {
            completionHandler([])
          }
        }
      }
    }
    
    func createCities(citiesToCreate: City, completionHandler: @escaping (City?) -> Void) {
        
        citiesStore.createCities(citiesToCreate: citiesToCreate) { (Cities: () throws -> City?) -> Void in
            do {
                let cities = try Cities()
                DispatchQueue.main.async {
                    completionHandler(cities)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
        }
    }
    }
}

// MARK: - Cities store API

protocol CitiesStoreProtocol {
  
  func fetchCities(completionHandler: @escaping (() throws -> [City]) -> Void)
  func fetchCities(id: String, completionHandler: @escaping (() throws -> City?) -> Void)
  func createCities(citiesToCreate: City, completionHandler: @escaping (() throws -> City?) -> Void)
  func updateCities(citiesToUpdate: City, completionHandler: @escaping (() throws -> City?) -> Void)
  func deleteCities(id: String, completionHandler: @escaping (() throws -> City?) -> Void)
}

// MARK: - Cities store CRUD operation results

typealias CitiesStoreFetchCitiessCompletionHandler = (CitiesStoreResult<[City]>) -> Void
typealias CitiessStoreFetchCitiesCompletionHandler = (CitiesStoreResult<City>) -> Void
typealias CitiessStoreCreateCitiesCompletionHandler = (CitiesStoreResult<City>) -> Void
typealias CitiessStoreUpdateCitiesCompletionHandler = (CitiesStoreResult<City>) -> Void
typealias CitiessStoreDeleteCitiesCompletionHandler = (CitiesStoreResult<City>) -> Void

enum CitiesStoreResult<U>
{
  case Success(result: U)
  case Failure(error: CitiesStoreError)
}


// MARK: - Cities store CRUD operation errors

enum CitiesStoreError: Equatable, Error
{
  case CannotFetch(String)
  case CannotCreate(String)
  case CannotUpdate(String)
  case CannotDelete(String)
}
