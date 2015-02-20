//
//  ViewController.swift
//  ResearchMonster
//
//  Created by Alex Hughes on 19/02/2015.
//  Copyright (c) 2015 SolutionBlender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginAction: UIButton!
    @IBOutlet weak var idTextbox: UITextField!
    @IBOutlet weak var passTextbox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginFunction(sender: AnyObject) {
        println("clicked" + idTextbox.text)
        let id = idTextbox.text
        let pass = passTextbox.text
        let request = NSMutableURLRequest(URL: NSURL(string: "http://rm.solutionblender.ca/login")!)
        request.HTTPMethod = "POST"
        let postString = "id="+id+"&password="+pass+"&mobile=1"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                println("error=\(error)")
                return
            }
            
            println("response = \(response)")
            
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
        }
        task.resume()

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

