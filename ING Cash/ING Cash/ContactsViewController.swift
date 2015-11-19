//
//  ContactsViewController.swift
//  ING Cash
//
//  Created by Paul Keller on 15/11/2015.
//  Copyright © 2015 Planet K Games. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ContactsViewController: UIViewController {
    /*
    var contactStore = CNContactStore()
    var contacts: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AppDelegate.sharedDelegate().checkAccessStatus({ (accessGranted) -> Void in
            print(accessGranted)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findContactsWithName(name: String) {
        AppDelegate.sharedDelegate().checkAccessStatus({ (accessGranted) -> Void in
            if accessGranted {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    do {
                        let predicate: NSPredicate = CNContact.predicateForContactsMatchingName(name)
                        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactBirthdayKey, CNContactViewController.descriptorForRequiredKeys()]
                        /*self.contacts = try self.store.unifiedContactsMatchingPredicate(predicate, keysToFetch:keysToFetch)
                        self.tableView.reloadData()*/
                    }
                    catch {
                        print("Unable to refetch the selected contact.")
                    }
                })
            }
        })
    }
}

extension ContactsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "MyCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
        cell!.textLabel!.text = contacts[indexPath.row].givenName + " " + contacts[indexPath.row].familyName
        
        if let birthday = contacts[indexPath.row].birthday {
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            formatter.timeStyle = .NoStyle
            
            cell!.detailTextLabel?.text = formatter.stringFromDate((birthday.date)!)
        }
        return cell!
    }
    
}

//MARK: - UITableViewDelegate

extension ContactsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controller = CNContactViewController(forContact: contacts[indexPath.row])
        //controller.contactStore = self.store
        controller.allowsEditing = false
        self.navigationController?.pushViewController(controller, animated: true)
    }
    */
}