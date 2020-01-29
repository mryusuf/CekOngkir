//
//  Kota.swift
//  CekOngkir
//
//  Created by Indra Permana on 28/01/20.
//  Copyright © 2020 Yusuf Indra. All rights reserved.
//

import Foundation

struct RajaOngkirCost: Codable {
    var rajaongkir: Result
}

struct Result: Codable {
    var results: [ResultCosts]
   
}

struct ResultCosts: Codable {
    var name: String?
    var costs: [Costs]?
}

struct Costs: Codable {
    var service: String?
    var description: String?
    var cost : [Cost]
}

struct Cost: Codable {
    var value: Int?
    var etd: String?
    var note: String?
}
