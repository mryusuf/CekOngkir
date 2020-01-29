//
//  Tbl_City+CoreDataClass.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Tbl_City)
public class Tbl_City: NSManagedObject {
    func toCity() -> City {
        return City(city_id: city_id, province_id: province?.province_id, province: province?.province, city_name: city_name, postal_code: postal_code)
        
    }
}
