//
//  detailsViewController.swift
//  assignmentProject
//
//  Created by Navaneethkrishnan Manoj on 25/11/22.
//

import UIKit
import Kingfisher
class detailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodInfo.productColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorList.dequeueReusableCell(withReuseIdentifier: "colorcell", for: indexPath) as! colorsCollectionCell
        cell.setColor(color: prodInfo.productColors[indexPath.row])
        return cell
    }
    

    
    var prodInfo : Element!
    
    
    @IBOutlet weak var prodDesc: UITextView!
    @IBOutlet weak var detailIMG: UIImageView!
    @IBOutlet weak var colorList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorList.delegate = self
        colorList.dataSource = self
        
        prodDesc.text = prodInfo.purpleDescription
        
        var url = URL(string: prodInfo.imageLink)
        detailIMG.kf.setImage(with: url)
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth =  collectionView.bounds.width/2
        return CGSize(width: collectionWidth, height: collectionWidth*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
