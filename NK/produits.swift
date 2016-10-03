//
//  produits.swift
//  NK
//
//  Created by Loris THIERRY on 21/04/16.
//  Copyright © 2016 Celine PHE. All rights reserved.
//

import UIKit

class produits: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageName = "Tunique Beryl-1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 80, y: 120, width: 150, height: 250)
        view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gauche(sender: UIButton) {
        let imageName = "Tunique Beryl-2"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 80, y: 120, width: 150, height: 250)
        view.addSubview(imageView)
    }
    
    @IBAction func droite(sender: UIButton) {
        let imageName = "Tunique Beryl-1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 80, y: 120, width: 150, height: 250)
        view.addSubview(imageView)
    }
    @IBAction func button(sender: UIButton) {
        let alert:UIAlertView = UIAlertView()
        alert.title = "Panier"
        alert.message = "L'article a bien été ajouté"
        alert.delegate = self
        alert.addButtonWithTitle("OK")
        alert.show()
        
    }

}
