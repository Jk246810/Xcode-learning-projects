//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    //This is calling from the xcdatamodeld?? 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save"{
            let note = self.note ?? CoreDataHelper.newNote()
            //Why is it storing it as a new note?????
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            //this is saying that once it is saved there will either be text or it puts no text if there is nil
            note.modificationTime = Date() as NSDate
            //there will always be a modification time
            CoreDataHelper.saveNote()
            //im calling the action that saves the note into the CoreData
        }
    }
    
    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note{
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        }else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
        //optional binding to show what will appear when the note is clicked. If there is writing then it will appear, but if there is nil then it will put a blank string
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
