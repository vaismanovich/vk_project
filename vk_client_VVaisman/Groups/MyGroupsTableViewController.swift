//
//  MyGroupsTableViewController.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 19/01/2022.
//

import UIKit


protocol MyGroupDelegate: AnyObject {
    func groupDidSelect (_ group: String)
}

class MyGroupsTableViewController: UITableViewController {
   
    @IBOutlet var myGroupsTableView: UITableView!
    
    var myGroups = [String] ()
    
    var VkGroupService = GroupsVkService()
    
    var MyGroupsCellIdentifier = "MyGroupsCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        VkGroupService.loadGroupsFromVK()

        
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = myGroupsTableView.dequeueReusableCell(withIdentifier: MyGroupsCellIdentifier, for: indexPath) as? MyGroupsCell
       else {
        return UITableViewCell()
       }

       let group = myGroups[indexPath.row]
        
        cell.groupName.text = group

        return cell
    }
    
    
    //MARK: - Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            myGroups.remove(at: indexPath.row)
            // Delete the row from the data source
            myGroupsTableView.deleteRows(at: [indexPath], with: .fade)
            
            myGroupsTableView.reloadData()
            
        }
    }

    //MARK: - Функция AddgroupsWith Segue
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            
            guard let availableGroupsController = segue.source as? AvailableGroupsController
            else {
                return
            }
            
            availableGroupsController.delegate = self
            
            if let indexPath = availableGroupsController.availableGroupsTableView.indexPathForSelectedRow {
                
                let group = availableGroupsController.availablegroups[indexPath.row]
                
                
                availableGroupsController.delegate?.groupDidSelect(group)
                
//                if !myGroups.contains(group) {
//
//                    myGroups.append(group)
//                    myGroupsTableView.reloadData()
                }
            }
        }
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


//MARK: - MyGroupDelegate
extension MyGroupsTableViewController: MyGroupDelegate {
    func groupDidSelect(_ group: String) {
        // Если такой группы нет то добавляем к списку
        if !myGroups.contains(group) {
            myGroups.append(group)
            myGroupsTableView.reloadData()
        }
    }
    
    
}
