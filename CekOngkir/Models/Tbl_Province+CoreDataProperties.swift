//
//  Tbl_Province+CoreDataProperties.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//
//

import Foundation
import CoreData


extension Tbl_Province {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tbl_Province> {
        return NSFetchRequest<Tbl_Province>(entityName: "Tbl_Province")
    }

    @NSManaged public var province_id: String?
    @NSManaged public var province: String?
    @NSManaged public var city: NSSet?

}

// MARK: Generated accessors for city
extension Tbl_Province {

    @objc(addCityObject:)
    @NSManaged public func addToCity(_ value: Tbl_City)

    @objc(removeCityObject:)
    @NSManaged public func removeFromCity(_ value: Tbl_City)

    @objc(addCity:)
    @NSManaged public func addToCity(_ values: NSSet)

    @objc(removeCity:)
    @NSManaged public func removeFromCity(_ values: NSSet)

}
