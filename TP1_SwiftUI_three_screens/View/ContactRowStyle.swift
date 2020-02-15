//
//  ContactRow.swift
//  contact_list
//
//  Created by vincent Berry on 10/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import SwiftUI

struct ContactRowStyle: View {
    
    var contact: Personne  // data model defined in Contact.swift
    
    var body: some View {
        HStack {
            Text(contact.name) //.font(.title)
            Spacer()
            Text("(")
            Text(contact.jobTitle).foregroundColor(Color.blue)
            Text(")")
        }
    }
}

//struct ContactRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactRow(contact: <#Contact#>)
//    }
//}
