//
//  Article.swift
//  akulaiev2019
//
//  Created by Anna Kulaieva on 10/11/19.
//

import Foundation
import CoreData

class Article: NSManagedObject {
    
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var modificationDate: NSDate?
    
    override public var description: String {
        return "title: " + title + "\n" + "content: " + content + "\n" + "language: " + language + "\n" + "created at: " + creationDate + "modified at: " + modificationDate
    }
}
