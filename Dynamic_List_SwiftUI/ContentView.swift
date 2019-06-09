//
//  ContentView.swift
//  Dynamic_List_SwiftUI
//
//  Created by Efren Abraham Tavarez on 6/6/19.
//  Copyright © 2019 Efren Abraham Tavarez. All rights reserved.
//

import SwiftUI


struct User: Identifiable {
    var id: Int
    
    let username, message, imageName: String
}


struct ContentView : View {
    
    let users: [User] = [
        .init(id: 0, username: "Steve Jobs", message: "Company: Apple", imageName: "Steve+Jobs"),
        .init(id: 1, username: "Bill Gates", message: "Company: Microsoft", imageName: "billgates"),
        .init(id: 2, username: "Mark Zuckerberg", message: "Company: Facebook", imageName: "markZ"),
        .init(id: 3, username: "Jeff Bezos", message: "Company: Amazon", imageName: "mynameitsjeff") ]
    
    var body: some View {
        NavigationView {
            List {
//                Text("Speaker List").font(.largeTitle)
                ForEach(users.identified(by: \.id)) { user in
                    
                    HStack {
                        Image(user.imageName)
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue,lineWidth: 3))
                            .frame(width: 70, height: 70)
//                            .clipped()
                        VStack(alignment: .leading) {
                            Text(user.username).font(.headline)
                            Text(user.message).font(.subheadline)
                        }.padding(.leading, 8)
                        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing:0))
                }
            }.navigationBarTitle(Text("Guest List"))
        }
      
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
