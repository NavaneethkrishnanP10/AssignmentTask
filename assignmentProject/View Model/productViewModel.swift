//
//  productViewModel.swift
//  assignmentProject
//
//  Created by Navaneethkrishnan Manoj on 24/11/22.
//

import Foundation
class productViewModel {
    private var srcURL = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json")!
    var prodModel = [Element]()
    
    func getData(completion: @escaping () -> ()){
        URLSession.shared.dataTask(with: srcURL) { [weak self] (data, response, error) in
            if let data = data {
                let prodData = try! JSONDecoder().decode([Element].self, from: data)
                self?.prodModel = prodData
                completion()
            }
        }.resume()
    }
}
