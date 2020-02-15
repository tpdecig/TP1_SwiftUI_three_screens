//
//  Contact.swift
//  contact_list
//
//  Created by vincent Berry on 10/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import Foundation
import Combine // to be used as ObjectBinding

class ContactList  // Class, not struct anymore as we need for sharing it with @ObjectBinding
    : ObservableObject,  // necessary for SwiftUI to follow changes on such an object
                       // (previously called BindableObject)
      Hashable // pour être inclus dans les rangs d'une List par un ForEach
    //, Identifiable
{
    // properties
    @Published var people : [Personne]
    
    // Init a vide
    init() { self.people =  []
    }
    // Initialisation avec personnes connues au départ
    init(liste: [Personne]) { self.people = liste }

    func add(_ p : Personne) { self.people.append(p) }
    func remove(at: Int) { self.people.remove(at: at) }
    func ieme(at: Int) -> Personne? {
        guard people.count > at else {return nil}
        return people[at]
    }
 
    
    // For Equatable protocol
    static func == (lhs: ContactList, rhs: ContactList) -> Bool {
        guard lhs.people.count == lhs.people.count else { return false }
        for (index, pers) in lhs.people.enumerated() {
            guard rhs.people[index].id == pers.id else { return false }
        }
        return true
    }
    // For hashable protocol, saying that is enough
    func hash(into hasher: inout Hasher) {
        people.forEach { hasher.combine($0.id) }
    }
    // not necessary in recent SwiftUI: var didChange = PassthroughSubject<Void, Never>()
}

// Donnees pour la phase de développement déclarées en var globale
#if DEBUG
    let listeTest =  [
        Personne(name: "Christophe", jobTitle: "Pape à mobile", phone: "0607080910"),
        Personne(name: "Lysiane", jobTitle: "Prézidente of ze Universe", phone: "0708091011"),
        Personne(name: "Philippe", jobTitle: "Magicien", phone: "0708281011")
    ]
    let testContacts = ContactList(liste: listeTest)
#endif
