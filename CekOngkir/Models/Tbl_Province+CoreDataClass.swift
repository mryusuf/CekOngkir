//
//  Tbl_Province+CoreDataClass.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Tbl_Province)
public class Tbl_Province: NSManagedObject {
    func toProvince() -> Province {
        return Province(province_id: province_id, province: province)
    }
}
