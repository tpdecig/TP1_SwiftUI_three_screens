//
//  AddContactView.swift
//  contact_list
//
//  Created by vincent Berry on 13/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import SwiftUI
import Combine

struct AddContactView: View {
    
    @ObservedObject var contacts : ContactList  // @OO <-- @ObjectBinding in recent SwiftUI
    @State private var newContact = Personne(name: "", jobTitle: "", phone: "")
      
    var body: some View {

        Form {
            HStack { Text("Nom :").padding(.all)
                TextField("entrez un nouveau nom", text: $newContact.name).padding(.all).background(Color(red:0.95,green:0.95,blue:0.95)).cornerRadius(6.0)
            }
            HStack { Text("Métier :").padding(.all)
                TextField("profession", text: $newContact.jobTitle).padding(.all).background(Color(red:0.95,green:0.95,blue:0.95)).cornerRadius(6.0)
            }
            HStack { Text("Tél :").padding(.all)
                TextField("numéro de téléphone", text: $newContact.phone).padding(.all).background(Color(red:0.95,green:0.95,blue:0.95)).cornerRadius(6.0)
            }
            HStack {
            Spacer()
            Button(action: {
                // What to perform
                print("New :",self.newContact.name)
                self.contacts.add(self.newContact)
                self.newContact = Personne(name: "", jobTitle: "", phone: "")
            }) {
                // How the button looks like
                Text("Ajouter")
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .padding(10)
            }.disabled(newContact.name == "")
           Spacer()
          }
        } // Form


    }
}

//struct AddContactView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddContactView(contacts: testContacts)
//    }
//}
