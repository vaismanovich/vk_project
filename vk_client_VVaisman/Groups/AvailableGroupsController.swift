//
//  AvailableGroupsController.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 19/01/2022.
//

import UIKit

class AvailableGroupsController: UITableViewController {

    @IBOutlet var availableGroupsTableView: UITableView!
    
    var availablegroups = [
            "Music Bed",
            "Apple News",
          "Street Style",
             "Paris News",
            "London Pub's",
            "American Tech"
    ]
    
    weak var delegate: MyGroupDelegate?
    
    
    var session = Session.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return availablegroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = availableGroupsTableView.dequeueReusableCell(withIdentifier: "AvailableGroupsCell", for: indexPath) as? AvailableGroupsCell else {
            return UITableViewCell()
        }
        
        let groups = availablegroups[indexPath.row]
        
        cell.availableGroupName.text = groups
        
        session.userID = 9
      
        return cell
    }
   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            availablegroups.remove(at: indexPath.row)
            // Delete the row from the data source
            availableGroupsTableView.deleteRows(at: [indexPath], with: .fade)
            
            availableGroupsTableView.reloadData()
        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата строка N \(indexPath.row) в секции \(indexPath.section)")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
