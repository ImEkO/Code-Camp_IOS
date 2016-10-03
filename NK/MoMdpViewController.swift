//
//  MoMdpViewController.swift
//  NK
//
//  Created by Loris THIERRY on 21/04/16.
//  Copyright © 2016 Celine PHE. All rights reserved.
//

import UIKit
import Foundation

class MoMdpViewController: UIViewController {
    
    
    
    @IBOutlet var tet1: UITextField!
    @IBOutlet var cacher: UITextField!
    
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
    
    
    
    
    @IBAction func Mdp(sender: UIButton) {
        let password:NSString = tet1.text!
        let cacher1:NSString = cacher.text!
        
        if( password.isEqualToString(""))
        {
            if (password.isEqualToString("")){
                self.tet1.text =  maVariableIneffacable.valueForKey("PASSWORD") as? String}
    
            let password:NSString = tet1.text!
            
            let post:NSString = "Password=\(password)&Cacher=\(cacher1)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"http://172.16.1.42/phe_c/NinaKendosa/modifmdp.php")!
            
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
            alert.message = "Felecitation votre Mot de passe a été modifier !"
            alert.delegate = self
            alert.addButtonWithTitle("OK")
            alert.show();
            self.performSegueWithIdentifier("q2", sender: self)
        }
        else{
            
            let post:NSString = "Password=\(password)&Cacher=\(cacher1)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"http://172.16.1.42/phe_c/NinaKendosa/modifmdp.php")!
            
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
            self.performSegueWithIdentifier("q2", sender: self)
            
        }//fin du SI champs vides
    }
    
}