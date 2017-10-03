//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    var notes = [Note](){
        //creates an array of notes
        didSet{
            tableView.reloadData()
        }
        //reloads the information displayed on the view controller constantly
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
        //the view is the # of notes (used to be return 10) now returning the # of notes created in the array
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        let row = indexPath.row
        //what specifically is the index path
        let note = notes[row]
        cell.noteTitleLabel.text = note.title
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()

        //confused on what is happening here
        
        return cell
    }
    //CONFUSED on the ENTIRE BLOCK of code, view for each row
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "displayNote"{
                print("Table view cell tapped")
                //when you click on the actual note
                let indexPath = tableView.indexPathForSelectedRow!
                //UNCLEAR what this line does
                let note = notes[indexPath.row]
                //notes is the array of notes and indexPath.row is a specific note that was clicked in the array
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                displayNoteViewController.note = note
                //this takes you to the actual note with the title and content
            }else if identifier == "addNote"{
                print("+ button tapped")
                //if a note is added to the array it is identified and the computer prints this sentence
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            CoreDataHelper.deleteNote(note: notes[indexPath.row])
            //accessing the delete note static function that was created in the Core Data Helper, note was a parameter and it is calling the note that was selected by saying indexPath.row
            notes = CoreDataHelper.retrieveNote()
            //confused why I am retrieving a note
            
        }
        
    }
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        self.notes = CoreDataHelper.retrieveNote()
        // confused on this one as well
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.retrieveNote()
        //when I am loading the notes app on simulater it is retrieving all the notes that were previously stored 
    }
    
    
}



