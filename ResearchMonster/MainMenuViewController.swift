//
//  MainMenuViewController.swift
//  ResearchMonster
//
//  Created by Alex Hughes on 2015-02-20.
//  Copyright (c) 2015 SolutionBlender. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate
 {
    
    var passvar : NSString?
    
   var myArray = NSMutableArray()
    var swiftBlogs = NSMutableArray()


    override func viewDidLoad() {
        super.viewDidLoad()
        
          println("Here we go")
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://research.solutionblender.ca/projects?mobile=1")!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            
            var parseError: NSError?
            let parsedObject : NSMutableArray = NSJSONSerialization.JSONObjectWithData(data,
                options: NSJSONReadingOptions.MutableContainers,
                error:&parseError) as! NSMutableArray
            
                //println(parsedObject)
            for (index, element) in enumerate(parsedObject) {
                //println("Item \(index): \(element)")
                var title = String()
                title = element["title"] as! String
            println(title)
                self.myArray.addObject(title)
               // self.swiftBlogs.append(title)
                
                //self.array.append(title)
               // self.swiftBlogs.append(parsedObject[index]["title"])
             
               
            }
            self.swiftBlogs = self.myArray

            self.tableView.reloadData()
            
         //swiftBlogs.append()
          //      println(parsedObject.valueForKey("title"))
           //    println(parsedObject.valueForKey("description"))

        
            
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
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
        return swiftBlogs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as! UITableViewCell
   
        let row = indexPath.row
          cell.textLabel?.text = swiftBlogs[row] as! String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(swiftBlogs[row])
    }

}
