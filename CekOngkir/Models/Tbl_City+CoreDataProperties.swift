//
//  Tbl_City+CoreDataProperties.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//
//

import Foundation
import CoreData


extension Tbl_City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tbl_City> {
        return NSFetchRequest<Tbl_City>(entityName: "Tbl_City")
    }

    @NSManaged public var city_id: String?
    @NSManaged public var city_name: String?
    @NSManaged public var postal_code: String?
    @NSManaged public var province: Tbl_Province?

}
