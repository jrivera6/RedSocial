//
//  IniciarSesionViewController.swift
//  RedSocial
//
//  Created by Jhonny Rivera on 5/28/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!, completion: { (user, error) in
            
            print("Intentamos iniciar sesion")
            if error != nil{
                print("Tenemos el siguiente error: \(String(describing: error))")
                
                Auth.auth().createUser(withEmail: self.txtEmail.text!, password: self.txtPassword.text!, completion: {(user, error) in
                    
                    print("Intentamos crear un usuario")
                    if error != nil {
                        print("Tenemos el siguiente error: \(String(describing: error))")
                    }else{
                        print("Creamos el usuario correctamente")
                        Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                        
                        self.performSegue(withIdentifier: "iniciarSesionSegue", sender: nil)
                    }
                    
                })
                
                
            }else{
                print("Se inicio sesion correctamente")
                self.performSegue(withIdentifier: "iniciarSesionSegue", sender: nil)
            }
            
        })
        
    }
    
}

