//
//  RajaOngkirCoreData.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//

import UIKit
import CoreData

class RajaOngkirCoreData: ProvincesStoreProtocol, CitiesStoreProtocol {
    
    private var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?

    // MARK: ProvincesStoreProtocol
    func fetchProvinces(completionHandler: @escaping (() throws -> [Province]) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
          do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tbl_Province")
            let results = try managedContext.fetch(fetchRequest) as! [Tbl_Province]
            let provinces = results.map { $0.toProvince() }
            print(provinces)
            completionHandler { return provinces }
          } catch {
            completionHandler { throw ProvincesStoreError.CannotFetch("Cannot fetch provinces") }
          }
        
    }
    
    func fetchProvince(id: String, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    func createProvince(provinceToCreate: Province, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let province = provinceToCreate
            let tblProvince = NSEntityDescription.insertNewObject(forEntityName: "Tbl_Province", into: managedContext) as! Tbl_Province
            tblProvince.province_id = province.province_id
            tblProvince.province = province.province
            try managedContext.save()

            print("PROVINCE IS \(String(describing: tblProvince.province))")
            completionHandler { return province }
        }
        catch {
            completionHandler { throw ProvincesStoreError.CannotCreate("Cannot create order with id \(String(describing: provinceToCreate.province_id))") }
        }

    }
    
    func updateProvince(ProvinceToUpdate: Province, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    func deleteProvince(id: String, completionHandler: @escaping (() throws -> Province?) -> Void) {
        
    }
    
    // MARK: CitiesStoreProtocol

    func fetchCities(completionHandler: @escaping (() throws -> [City]) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
          do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tbl_City")
            let results = try managedContext.fetch(fetchRequest) as! [Tbl_City]
            let cities = results.map { $0.toCity() }
//            print(cities)
            completionHandler { return cities }
          } catch {
            completionHandler { throw CitiesStoreError.CannotFetch("Cannot fetch cities") }
          }
    }
    
    func fetchCities(id: String, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
    
    func createCities(citiesToCreate: City, completionHandler: @escaping (() throws -> City?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let city = citiesToCreate
            let tblCity = NSEntityDescription.insertNewObject(forEntityName: "Tbl_City", into: managedContext) as! Tbl_City
            tblCity.city_id = city.city_id
            tblCity.city_name = city.city_name
            tblCity.postal_code = city.postal_code
            let province_id = city.province_id ?? ""
            let predicate = NSPredicate(format: "province_id == %@", province_id)
            
            let fetchRequest = NSFetchRequest<Tbl_Province>(entityName: "Tbl_Province")
            fetchRequest.predicate = predicate
            let fetchedProvince = try managedContext.fetch(fetchRequest)
            fetchedProvince[0].addToCity(tblCity)
            
            
            try managedContext.save()

//            print("City IS \(String(describing: tblCity.city_name))")
            completionHandler { return city }
        }
        catch {
            completionHandler { throw CitiesStoreError.CannotCreate("Cannot create order with id \(String(describing: citiesToCreate.city_id))") }
        }
    }
    
    func updateCities(citiesToUpdate: City, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
    
    func deleteCities(id: String, completionHandler: @escaping (() throws -> City?) -> Void) {
        
    }
}
