//
//  MainMenuViewController.swift
//  ResearchMonster
//
//  Created by Alex Hughes on 2015-02-20.
//  Copyright (c) 2015 SolutionBlender. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    var passvar : NSString?

    override func viewDidLoad() {
        super.viewDidLoad()
        
          println("Here we go")
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://research.solutionblender.ca/projects?mobile=1")!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            println(NSString(data:data,encoding:NSUTF8StringEncoding))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
     override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1; //count(model)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as UITableViewCell
   
        let row = indexPath.row
       // cell.textLabel?.text = "test";///swiftBlogs[row]
        
        return cell
    }

}
