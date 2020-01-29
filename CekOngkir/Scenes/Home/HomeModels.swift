//
//  HomeModels.swift
//  CekOngkir
//
//  Created by Indra Permana on 28/01/20.
//  Copyright (c) 2020 Yusuf Indra. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Home
{
  // MARK: Use cases
  
  enum FetchRajaOngkir
  {
    struct Request
    {
    }
    struct Response
    {
        var provinces: [Province]
    }
    struct ViewModel
    {
        struct displayedProvince {
            var province: String
        }
        struct displayedCity {
            var cityName: String
        }
        var displayedProvinces: [displayedProvince]
        var displayedCities: [displayedCity]
    }
  }
    
    enum SaveToLocal {
        struct Request {
            var provinces: Province
            var city: City
        }
        struct Response {
            
        }
        struct ViewModel {
            
        }
    }
}
