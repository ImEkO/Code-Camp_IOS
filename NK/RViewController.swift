//
//  RViewController.swift
//  Login JSON
//
//  Created by Loris THIERRY on 14/04/16.
//  Copyright © 2016 Arthur JANSSENS. All rights reserved.
//
import UIKit
import Foundation

class RViewController: UIViewController {
    
    @IBOutlet var champ1: UITextField!
    @IBOutlet var champ2: UITextField!
    @IBOutlet var champ3: UITextField!
    @IBOutlet var champ4: UITextField!
    @IBOutlet var champ5: UITextField!
    @IBOutlet var champ6: UITextField!
    @IBOutlet var champ7: UITextField!
    @IBOutlet var champ8: UITextField!
    @IBOutlet var champ9: UITextField!
    @IBOutlet var champ10: UITextField!
    
    
    let maVariableIneffacable:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //code à charger après le chargement de la vue
        let estLoguer:Int = maVariableIneffacable.integerForKey("estCO") as Int
        if(estLoguer == 1){
            //si on est connecté à l'ouverture de l'appliction
            self.performSegueWithIdentifier("r", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
        
    }
    
    

    @IBAction func sinscrire(sender: UIButton) {
        
        let nom:NSString = champ1.text!
        let prenom:NSString = champ2.text!
        let email:NSString = champ3.text!
        let password:NSString = champ4.text!
        let adresse:NSString = champ5.text!
        let commune:NSString = champ6.text!
        let codepostal:NSString = champ7.text!
        let pays:NSString = champ8.text!
        let telephone1:NSString = champ9.text!
        let telephone2:NSString = champ10.text!
        
        
        if( email.isEqualToString("") || password.isEqualToString("") ||
            nom.isEqualToString("") || prenom.isEqualToString("") || commune.isEqualToString("") ||
            telephone1.isEqualToString("") || telephone2.isEqualToString("") || !isValidEmail(email as String) || codepostal.isEqualToString("") || pays.isEqualToString("") || adresse.isEqualToString("")){
            //si les champs sont vides
            let alert:UIAlertView = UIAlertView()
            alert.title = "Erreur"
            alert.message = "Entrez vos identifiants"
            alert.delegate = self
            alert.addButtonWithTitle("OK")
            alert.show()
        }else{
            
            let post:NSString = "Nom=\(nom)&Prenom=\(prenom)&Email=\(email)&Password=\(password)&Adresse=\(adresse)&Commune=\(commune)&Code=\(codepostal)&Pays=\(pays)&Telephone1=\(telephone1)&Telephone2=\(telephone2)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"http://172.16.1.42/phe_c/NinaKendosa/register.php")!
            
            let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            let postLength:NSString = String( postData.length )
            
            let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            var response: NSURLResponse?
            
            var urlData: NSData?
            
            do
            {
                urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
            }
            catch _ as NSError
            {
                urlData = nil
            }
            let alert:UIAlertView = UIAlertView()
            alert.title = "Bravo"
            alert.message = "Felecitation vous êtes inscrit !"
            alert.delegate = self
            alert.addButtonWithTitle("OK")
            alert.show();
            self.performSegueWithIdentifier("k", sender: self)
            
        }//fin du SI champs vides
    }
    
}
