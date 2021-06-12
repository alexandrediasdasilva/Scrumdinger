//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Alexandre Dias Da Silva on 12/06/2021.
//

import SwiftUI

struct ScrumsView: View {
    
    let scrums: [DailyScrum]
    
    var body: some View {
        
        List {
            
            ForEach(scrums) { scrum in
                
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
                
            }
            
        }
        
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
