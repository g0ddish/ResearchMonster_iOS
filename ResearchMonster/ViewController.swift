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
    
    private var data: NSString = "test"
    override func viewDidLoad() {
        super.viewDidLoad()
        
              // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginFunction(sender: AnyObject) {
       // println("clicked" + idTextbox.text)
        let id = idTextbox.text
        let pass = passTextbox.text
        let request = NSMutableURLRequest(URL: NSURL(string: "http://research.solutionblender.ca/login")!)
        request.HTTPMethod = "POST"
        var session = NSURLSession.sharedSession()
        let postString = "id="+id+"&password="+pass+"&mobile=1"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error)in
        var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
        var err: NSError?
            
        var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSArray
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            //println(jsonResult)
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                var success = jsonResult["student_id"] as? String
                if(success != nil){
                  //  println("Success: \(success)")
                    //println(jsonResult)
                    self.data = strData!
                    for (index, element) in enumerate(jsonResult) {
                       // println("\(index): \(element)")
                    }
                   
                

                }else{
                    println("Error could not parse JSON")
                }
        
            }
          ////  NSOperationQueue.mainQueue().addOperationWithBlock {
           //     self.performSegueWithIdentifier("MainMenuSeg", sender:self)            }
            
        })
    
      
        task.resume()
        
        
        

    }
    
 
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var datapass = self.data
       // let destvc = segue.destinationViewControlleras!s MainMenuViewController
      //  destvc.passvar = datapass
    }


}

