//
//  ListProvinciesCitiesInteractor.swift
//  CekOngkir
//
//  Created by Indra Permana on 29/01/20.
//  Copyright (c) 2020 Yusuf Indra. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListProvinciesCitiesBusinessLogic
{
  func doSomething(request: ListProvinciesCities.Something.Request)
}

protocol ListProvinciesCitiesDataStore
{
  //var name: String { get set }
}

class ListProvinciesCitiesInteractor: ListProvinciesCitiesBusinessLogic, ListProvinciesCitiesDataStore
{
  var presenter: ListProvinciesCitiesPresentationLogic?
  var worker: ListProvinciesCitiesWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ListProvinciesCities.Something.Request)
  {
    worker = ListProvinciesCitiesWorker()
    worker?.doSomeWork()
    
    let response = ListProvinciesCities.Something.Response()
    presenter?.presentSomething(response: response)
  }
}