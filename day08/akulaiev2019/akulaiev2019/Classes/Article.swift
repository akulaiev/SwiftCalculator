//
//  Article.swift
//  akulaiev2019
//
//  Created by Anna KULAIEVA on 10/11/19.
//

import CoreData

@objc(Article)
public class Article: NSManagedObject {

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var modificationDate: NSDate?
    
    override public var description: String {
        return "Title:  \(title!)\nContent: \(content!)\nLanguage: \(language!)\nCreated at: \(creationDate!)\nModified at: \(modificationDate!)"
    }
}
