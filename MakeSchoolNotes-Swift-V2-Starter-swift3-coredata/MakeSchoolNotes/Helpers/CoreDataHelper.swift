//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Brian on 6/22/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import CoreData
import UIKit

class CoreDataHelper{
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func newNote() -> Note{
       let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    static func saveNote(){
        do{
            try managedContext.save()
        } catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    
    static func deleteNote(note: Note){
        managedContext.delete(note)
        saveNote()
        //why do i have to save this?
    }
    
    static func retrieveNote() -> [Note]{
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError{
            print("could not fetch \(error)")
        }
        return []
        //what is the point of this return
    }
}
