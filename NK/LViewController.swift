//
//  ViewController.swift
//  Login JSON
//
//  Créé par Arthur JANSSENS le 25 mai 2015.
//  Fichier sans Copyright mais vous n'avez pas de droit commercial sur l'enssemble du projet.
//
//Tutoriel disponible à cette adresse:
//http://www.a-j-evolution.com/tutos/apple_swift_ios.php#applogin
//

import UIKit

class LViewController: UIViewController {
    
    @IBOutlet var monchamp: UITextField!

    @IBOutlet var monchamp2: UITextField!
    

    
    /* NSUserDefaults est capable de stoquer:
     NSData, NSString, NSNumber, NSDate, NSArray, ou NSDictionary.
     https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/index.html
     */
    let maVariableIneffacable:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.
        
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
    


    @IBAction func seConnecter(sender: UIButton) {
        let username:NSString = monchamp.text!
        let password:NSString = monchamp2.text!
        
        if( username.isEqualToString("") || password.isEqualToString("") ){
            //si les champs sont vides
            let alert:UIAlertView = UIAlertView()
            alert.title = "Erreur"
            alert.message = "Entrez vos identifiants"
            alert.delegate = self
            alert.addButtonWithTitle("OK")
            alert.addButtonWithTitle("Pourquoi pas, d'accord")
            alert.show()
        }else{
            
            let post:NSString = "pseudo=\(username)&mdp=\(password)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"http://172.16.1.42/phe_c/NinaKendosa/login.php")!
            
            let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            let postLength:NSString = String( postData.length )
            
            let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            var urlData: NSData?
            do {
                urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
            } catch _ as NSError {
                urlData = nil
            } catch {
                fatalError()
            }
            
            
            
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    let responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    var error: NSError?
                    
                    var jsonData:NSDictionary = NSDictionary()
                    do {
                        jsonData = try NSJSONSerialization.JSONObjectWithData(urlData!,options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    }catch {  // handle error
                    }
                    
                    
                    let success:Int = jsonData.valueForKey("erreur") as! Int
                    
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Login OK");
                        
                        let prenomJSON:String = jsonData.valueForKey("Prenom") as! String
                        let emailJSON:String = jsonData.valueForKey("Email") as! String
                        let nomJSON:String = jsonData.valueForKey("Nom") as! String
                        let communeJSON:String = jsonData.valueForKey("Commune") as! String
                        let telephone1JSON:String = jsonData.valueForKey("Telephone1") as! String
                        let telephone2JSON:String = jsonData.valueForKey("Telephone2") as! String
                        let mdpJSON:String = jsonData.valueForKey("Password") as! String
                        let adresseJSON:String = jsonData.valueForKey("Adresse") as! String
                        let paysJSON:String = jsonData.valueForKey("Pays") as! String
                        let codeJSON:String = jsonData.valueForKey("Code") as! String
                        
                        maVariableIneffacable.setObject(prenomJSON, forKey: "PRENOM")
                        maVariableIneffacable.setObject(emailJSON, forKey: "EMAIL")
                        maVariableIneffacable.setObject(nomJSON, forKey: "NOM")
                        maVariableIneffacable.setObject(communeJSON, forKey: "COMMUNE")
                        maVariableIneffacable.setObject(telephone1JSON, forKey: "TELEPHONE1")
                        maVariableIneffacable.setObject(telephone2JSON, forKey: "TELEPHONE2")
                        maVariableIneffacable.setObject(mdpJSON, forKey: "MDP")
                        maVariableIneffacable.setObject(adresseJSON, forKey: "ADRESSE")
                        maVariableIneffacable.setObject(paysJSON, forKey: "PAYS")
                        maVariableIneffacable.setObject(codeJSON, forKey: "CODE")
                        maVariableIneffacable.setInteger(1, forKey: "estCO")
                        maVariableIneffacable.synchronize()
                        self.performSegueWithIdentifier("r", sender: self)
                        
                    }else{
                        NSLog("Login échoué");
                        
                        let alertView:UIAlertView = UIAlertView()
                        alertView.title = "Invalide"
                        alertView.message = "Vos identifiants ne correspondent pas"
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
                } else {
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Erreur"
                    alertView.message = "Veuillez vous connecter à internet"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            } else {
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "Erreur"
                alertView.message = "Veuillez vous connecter à internet"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
            
        }//fin du SI champs vides
    }
    
}

