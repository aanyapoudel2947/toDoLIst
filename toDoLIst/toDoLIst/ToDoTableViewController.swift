//
//  ToDoTableViewController.swift
//  toDoLIst
//
//  Created by Scholar on 7/15/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var ToDos : [ToDoCD] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //ToDos = createToDos()
        getToDos()
        
        }
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
        
    
    }
    

   
    func getToDos() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
          func getToDos() {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

              if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                      ToDos = coreDataToDos
                      tableView.reloadData()
                  }
              }
            }
          }

      }
    
    

    
    func createToDos ()-> [ToDo]{
       
       let crime = ToDo()
       crime.name = " listen too music"
       
       
       let dog = ToDo()
       dog.name = "sneak a dog onto campus"
        dog.important = false
        
        return [crime,dog]
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = ToDos[indexPath.row]
        
        if let name = toDo.name{
            if toDo.important{
                cell.textLabel?.text = "🎧" + (toDo.name)!
            } else {
                cell.textLabel?.text = toDo.name
            }
                
    
        }
        return cell
    }//end of tableView
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
  if let addVC = segue.destination as? AddToDoViewController{
      addVC.previousVC = self
  }
        
    if let completeVC = segue.destination as? completeToDoViewController {
    if let toDo = sender as? ToDo{
        completeVC.selectedToDo = toDo
        completeVC.previousVC = self
    }
    }
        
    }//end of prepare
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = ToDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
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

