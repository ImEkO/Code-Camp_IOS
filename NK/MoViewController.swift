//
//  RViewController.swift
//  Login JSON
//
//  Created by Loris THIERRY on 14/04/16.
//  Copyright © 2016 Arthur JANSSENS. All rights reserved.
//
import UIKit
import Foundation

class MoViewController: UIViewController {

    

    @IBOutlet var tet1: UITextField!
    @IBOutlet var tet2: UITextField!
    @IBOutlet var tet3: UITextField!
    @IBOutlet var tet4: UITextField!
    @IBOutlet var tet5: UITextField!
    @IBOutlet var tet6: UITextField!
    @IBOutlet var cacher: UITextField!
    @IBOutlet var tet9: UITextField!
    @IBOutlet var tet7: UITextField!
    @IBOutlet var tet8: UITextField!

   
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
    



    @IBAction func buttonrgfe(sender: UIButton) {
        let nom:NSString = tet1.text!
        let prenom:NSString = tet2.text!
        let email:NSString = tet3.text!
        let commune:NSString = tet4.text!
        let telephone1:NSString = tet5.text!
        let telephone2:NSString = tet6.text!
        let adresse:NSString = tet7.text!
        let pays:NSString = tet8.text!
        let code:NSString = tet9.text!
        self.cacher.text = maVariableIneffacable.valueForKey("EMAIL") as? String
        let cacher1:NSString = cacher.text!
        
        if( email.isEqualToString("") || nom.isEqualToString("") || prenom.isEqualToString("") || commune.isEqualToString("") ||
            telephone1.isEqualToString("") || telephone2.isEqualToString("") || adresse.isEqualToString("") || pays.isEqualToString("") || code.isEqualToString("") || !isValidEmail(email as String))
        {
            if (nom.isEqualToString("")){
                self.tet1.text =  maVariableIneffacable.valueForKey("NOM") as? String}
            if (prenom.isEqualToString("")){
                self.tet2.text =  maVariableIneffacable.valueForKey("PRENOM") as? String}
            if (email.isEqualToString("")){
                self.tet3.text =  maVariableIneffacable.valueForKey("EMAIL") as? String}
            if (commune.isEqualToString("")){
                self.tet4.text =  maVariableIneffacable.valueForKey("COMMUNE") as? String}
            if (telephone1.isEqualToString("")){
                self.tet5.text =  maVariableIneffacable.valueForKey("TELEPHONE1") as? String}
            if (telephone2.isEqualToString("")){
                self.tet6.text =  maVariableIneffacable.valueForKey("TELEPHONE2") as? String}
            if (adresse.isEqualToString("")){
                self.tet7.text =  maVariableIneffacable.valueForKey("ADRESSE") as? String}
            if (pays.isEqualToString("")){
                self.tet8.text =  maVariableIneffacable.valueForKey("PAYS") as? String}
            if (code.isEqualToString("")){
                self.tet9.text =  maVariableIneffacable.valueForKey("CODE") as? String}
            
            let nom:NSString = tet1.text!
            let prenom:NSString = tet2.text!
            let email:NSString = tet3.text!
            let commune:NSString = tet4.text!
            let telephone1:NSString = tet5.text!
            let telephone2:NSString = tet6.text!
            let adresse:NSString = tet7.text!
            let pays:NSString = tet8.text!
            let code:NSString = tet9.text!
            
            let post:NSString = "Nom=\(nom)&Prenom=\(prenom)&Email=\(email)&Commune=\(commune)&Telephone1=\(telephone1)&Telephone2=\(telephone2)&Cacher=\(cacher1)&Adresse=\(adresse)&Pays=\(pays)&Code=\(code)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"http://172.16.1.42/phe_c/NinaKendosa/modif.php")!
            
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
            self.performSegueWithIdentifier("q", sender: self)
        }
        else{
            
            let post:NSString = "Nom=\(nom)&Prenom=\(prenom)&Email=\(email)&Commune=\(commune)&Telephone1=\(telephone1)&Telephone2=\(telephone2)&Cacher=\(cacher1)&Adresse=\(adresse)&Pays=\(pays)&Code=\(code)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"http://172.16.1.42/phe_c/NinaKendosa/modif.php")!
            
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
            self.performSegueWithIdentifier("q", sender: self)
            
        }//fin du SI champs vides
    }
    
}