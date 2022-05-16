//
//  FirebaseManager.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import Foundation
import Firebase
class FirebaseManager: NSObject {

    let auth: Auth

    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()

        super.init()
    }

}
