//
//  autreViewController.swift
//  Login JSON
//
//  Created by Arthur JANSSENS on 25/05/2015.
//  Fichier sans Copyright mais vous n'avez pas de droit commercial sur l'enssemble du projet.
//
//Tutoriel disponible à cette adresse:
//http://www.a-j-evolution.com/tutos/apple_swift_ios.php#applogin
//

import UIKit
import Foundation

class autreViewController: UIViewController {
    
    
    @IBOutlet var monlabel: UILabel!
    @IBOutlet var monlabel2: UILabel!
    @IBOutlet var moblabel3: UILabel!
    
    /* NSUserDefaults est capable de stoquer:
    NSData, NSString, NSNumber, NSDate, NSArray, ou NSDictionary.
    https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/index.html
    */
    let maVariableIneffacable:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.
        self.monlabel.text = "Bienvenue " + (maVariableIneffacable.valueForKey("NOM") as! String)
        self.monlabel2.text = maVariableIneffacable.valueForKey("PRENOM") as? String
        self.moblabel3.text = maVariableIneffacable.valueForKey("EMAIL") as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seDeconnecter(sender: UIButton) {
        NSUserDefaults.standardUserDefaults()
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        self.performSegueWithIdentifier("r2", sender: self)
    }
}
