//
//  ContentView.swift
//  FaceIDTest
//
//  Created by Daniel Wade Duggin on 12/11/22.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack{
            if self.isUnlocked{
                Text("Logged in to CrowdCheck")
            } else{
                Text("Please sign in")
            }
        }
        
        .onAppear(perform: authenticateUser)
    }
    
    func authenticateUser(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let textReason = "We need to access your face"
            
            //this enables faceID
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: textReason){success, authenticationError in DispatchQueue.main.async{
                if success {
                    self.isUnlocked = true
                } else{
                    
                }
            }
            }
        } else{
            //error in biometrics
        }
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
