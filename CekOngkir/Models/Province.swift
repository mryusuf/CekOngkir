//
//  Provinsi.swift
//  CekOngkir
//
//  Created by Indra Permana on 28/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//

import Foundation

struct RajaOngkirProvince:Codable {
    let rajaongkir: ResultProvince
}

struct ResultProvince:Codable {
    let results: [Province]
}

struct Province: Codable {
    let province_id: String?
    let province: String?
}

struct RajaOngkirCity:Codable {
    let rajaongkir: ResultCity
}

struct ResultCity:Codable {
    let results: [City]
}

struct City: Codable {
    let city_id: String?
    let province_id: String?
    let province: String?
    let type: String?
    let city_name: String?
    let postal_code: String?
}
