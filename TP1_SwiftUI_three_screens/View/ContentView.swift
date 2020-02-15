//
//  ContentView.swift
//  contact_list
//
//  Created by vincent Berry on 10/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import SwiftUI

// Vue principale
struct ContentView: View {
    // cette var va être transmise à la vue AddContactView qui pourra modifier cette liste (ajout d'une personne)
    @ObservedObject private var contacts = testContacts //ContactList()

    func delete(index: IndexSet) {
        if let first = index.first {
            // NOTONS que contrairement à une var @State,
            // il ne faut pas mettre de $ devant le nom d'une @OO
            self.contacts.remove(at: first)
        }
    }
    
    var body: some View { // fabrique la vue principale (ContactView)
        //VStack {
            NavigationView {
                // une @ViewBuilder closure utilisée pour init la List
                // List(contacts, id: \.name) { // ok que si liste entièrement automatique
                VStack {
                    List {
                        // ForEach est forcé si on veut faire une liste en partie composée
                        // automatiquement ET en partie à la main
                        ForEach(contacts.people, id : \.self) {  c in
                            NavigationLink(destination: ShowPersonneDetail(contact: c)) {
                                ContactRowStyle(contact: c)  }
                        }.onDelete(perform: delete)
                    }.navigationBarTitle("Mes contacts", displayMode: .inline)
                    // Navigation to AddContactView:
                    NavigationLink(destination: AddContactView(contacts: self.contacts)) {
                        Text("Ajouter un contact").padding()
                        .background(Color.green)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(5)
                    }
                    Spacer()
            } // VStack
          }
        //}
    }    
} // struct
        
    #if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
