//
//  TableViewController.swift
//  NewEditTableView
//
//  Created by tham gia huy on 5/9/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var noData: UILabel!
    @IBOutlet weak var noDataView: UIView!
    var arrayNumber = [Int](1...5)
    var hasNoData: Bool = false {
        didSet {
            hasNoData ? (tableView.backgroundView = noData) : (tableView.backgroundView = noDataView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNumber.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(arrayNumber[indexPath.row])"
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayNumber.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            hasNoData = arrayNumber.count == 0
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            if let vc = segue.destination as? ViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    vc.so = arrayNumber[indexPath.row]
                }
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let detailVc = unwindSegue.source as? ViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            arrayNumber[indexPath.row] = detailVc.so ?? 0
        } else {
            arrayNumber.append(detailVc.so ?? 0)
        }
        hasNoData = arrayNumber.count == 0
        tableView.reloadData()
    }

}
