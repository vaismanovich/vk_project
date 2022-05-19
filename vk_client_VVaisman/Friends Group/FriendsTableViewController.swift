//
//  FriendsTableViewController.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 14/11/2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet var friendsTableView: UITableView!
    
    var cellsForAnimate: [FriendsViewCell] = []
    
    
    
    
  var myFriends = FriendsArray.iNeedFriends()
    var lettersOfNames = [String]()
    lazy var filteredFriend = myFriends
    
    var items: FriendsModel?
    
    var service = FriendsVkService2()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
            // let date = Date(timeIntervalSince1970: TimeInterval(items?.response.items.forEach {$0.id} ?? 0))
       
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "DD.MM.YYYY"
        
       // FriendsVkService2().loadFriends()
        
        FriendsVkService2().loadFriends { result in
            switch result{
            case .success(_): break

            case .failure(_):
                break
            }
        }
        
  //      myFriends.myUsers.sort()
       self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FriendsViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return filteredFriend.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredFriend[section].data.count
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = myFriends[section]
        
        return String(section.key)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = friendsTableView.dequeueReusableCell(withIdentifier: "FriendsViewCell", for: indexPath) as? FriendsViewCell
       else {
        return UITableViewCell()
       }

        let section = filteredFriend[indexPath.section]
        let name = section.data[indexPath.row].name
        let image = section.data[indexPath.row].image
        
        cell.configure(name: name, image: UIImage(named: image)!)
        
        cellsForAnimate.append(cell)
        return cell
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

}
