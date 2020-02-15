//
//  ContactDetail.swift
//  contact_list
//
//  Created by vincent Berry on 10/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import SwiftUI
// import Combine  pas encore besoin ici

struct ShowPersonneDetail: View {
    
    // @OO now quand on voudra modifier le fait que c'est un contact favori
    // @ObservedObject
    var contact: Personne  // data model defined in Contact.swift
        
    var body: some View {
        VStack {
            Spacer()
            Text("Détail de ce contact").font(.title).fontWeight(.bold)
            Spacer()
            HStack {
                Spacer()
                Text("Nom : ").fontWeight(.bold)
                Spacer()
                Text(contact.name)
                Spacer()
                }
            Spacer()
            HStack {
                 Spacer()
                 Text("Travail : ").fontWeight(.bold)
                 Spacer()
                 Text(contact.jobTitle)
                Spacer()
                 }
            Spacer()
            HStack {
                 Spacer()
                 Text("Tél : ").fontWeight(.bold)
                 Spacer()
                 Text(contact.phone)
                Spacer()
                 }
            Spacer()
            // Quand on voudra changer la prop isFavorite du contact
            // Toggle(isOn: contact.isFavorite, label: { Text("Favori") })
        }
    }
}

//struct ContactDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactDetail()
//    }
//}
