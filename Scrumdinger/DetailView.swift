//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Alexandre Dias Da Silva on 12/06/2021.
//

import SwiftUI

struct DetailView: View {
    
    let scrum: DailyScrum
    @State private var isPresented = false
    
    var body: some View {
        
        List {
            
            Section(header: Text("Meeting Info")) {
                
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .accessibilityLabel(Text("Start meeting"))
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                    
                }
                
                HStack {
                    
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                    
                }
                .accessibilityElement(children: .ignore)
                
            }
            
            Section(header: Text("Attendees")) {
                
                ForEach(scrum.attendees, id: \.self) { attendee in
                    
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))

                }
                
            }
            
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
          isPresented = true
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                    })
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}