//
//  ViewController.swift
//  assignmentProject
//
//  Created by Navaneethkrishnan Manoj on 21/11/22.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate{
    
    //Variables declared
    var searchResults = [Element]()
    var viewModel = productViewModel()
    var productData = [Element]()
    var sendingInfo : Element!
    
 
    //Outlets created
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        //Data fetched from viewModel
        viewModel.getData { [weak self] in
            self!.productData = self!.viewModel.prodModel
            self!.searchResults = self!.productData //'searchResults' is used for searching products
            DispatchQueue.main.async {
                self?.productsTable.reloadData()
            }
            
        }
        //TableViewCell registered
        productsTable.register(UINib.init(nibName: "productsTableViewCell", bundle: nil), forCellReuseIdentifier: "productsTableViewCell")
        productsTable.estimatedRowHeight = 143
        // Do any additional setup after loading the view.
    }

    //selected product details data sent through segue to detailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails"{
            let destinationVC = segue.destination as! detailsViewController
            destinationVC.prodInfo = sendingInfo
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = []
        if searchText == ""{ //search is empty all products are displayed
            searchResults = productData
        }
        for product in productData{
            if searchText.uppercased() == product.name.uppercased(){
                searchResults.append(product)
            }
        }
        //reload tableView after search is done
        self.productsTable.reloadData()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productsTable.dequeueReusableCell(withIdentifier: "productsTableViewCell", for: indexPath) as? productsTableViewCell else {
            print("failed to get cell")
            return UITableViewCell()
        }
        let row = self.searchResults[indexPath.row]
        cell.dataPass(row: row)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendingInfo = self.productData[indexPath.row]
        performSegue(withIdentifier: "showDetails"
                     , sender: self)
        
    }
}
