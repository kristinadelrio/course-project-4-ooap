//
//  SongsRepository.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

class SongsRepository {
    
    static func get() -> [Song] {
        return [
            Content(url: "https://www.youtube.com/watch?v=zEf423kYfqk",
                    title: "Becky G, Natti Natasha - Sin Pijama"),
            
            Content(url: "https://www.youtube.com/watch?v=UWLr2va3hu0",
                    title: "Pitbull & J Balvin - Hey Ma ft Camila Cabello"),
            
            Content(url: "https://www.youtube.com/watch?v=qj3zXu5nclE",
                    title: "Gente de Zona - Te Duele"),
            
            Content(url: "https://www.youtube.com/watch?v=bS3uSzk4VwY",
                    title: "Dua Lipa - Want To"),
            
            Content(url: "https://www.youtube.com/watch?v=mlf4bidp2yc",
                    title: "Sean Paul, David Guetta - Mad Love ft. Becky G"),
            
            Content(url: "https://www.youtube.com/watch?v=HAc3T4aMENI",
                    title: "C. Tangana, Becky G - Booty"),
            
            Content(url: "https://www.youtube.com/watch?v=p7bfOZek9t4",
                    title: "ROSALÍA, J Balvin - Con Altura"),
            
            Content(url: "https://www.youtube.com/watch?v=jKbR7u8J5PU",
                    title: "Pitbull - Fun ft. Chris Brown")
        ]
    }
}
