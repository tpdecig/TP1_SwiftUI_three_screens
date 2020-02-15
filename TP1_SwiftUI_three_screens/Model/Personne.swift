//
//  Personne.swift
//  contact_list
//
//  Created by vincent Berry on 13/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import Foundation

// Ne se conforme pas à ObservedObject car c'est le tableau dont on veut monitorer le changement pour l'instant
// Si on veut réagir à un changement d'une personne (changement de tél),
//    il faudra alors que Personne suive le protocole ObservedObject
struct Personne: Identifiable, Hashable {
    // properties
    var id = UUID()
    var name:String
    var jobTitle:String
    var phone:String
    //var isFavorite:Bool

    // Initializer
    init(name n:String, jobTitle j:String, phone p:String) {
        self.name = n ; self.jobTitle=j ; self.phone=p  //  ; self.isFavorite = false
    }
}

