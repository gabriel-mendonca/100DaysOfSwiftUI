//
//  AstronautView.swift
//  Moonshot
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 07/04/21.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let mission: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    if !mission.isEmpty {
                        Form {
                            Section(header: Text("Flew")) {
                                List(self.mission) { mission in
                                    Text(mission.displayName)
                                }
                            }
                        }
                    }
                    
                }
            }
        }.navigationBarTitle(Text(astronaut.name),displayMode: .inline)
    }
    
    init(missions: [Mission], astronauts: Astronaut) {
        self.astronaut = astronauts
        
        var missionFlew: [Mission] = []
        
        for mission in missions {
            for crew in mission.crew {
                if crew.name == astronaut.id {
                    missionFlew.append(mission)
                }
            }
        }
        self.mission = missionFlew
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missionss: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(missions: missionss , astronauts: astronauts[0])
    }
}
