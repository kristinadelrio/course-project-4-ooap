//
//  MoviesRepository.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation


class MoviesRepository {
    
    static func get() -> [Movie] {
        return [
            Content(url: "https://www.youtube.com/watch?v=eQHFYvGdqPM",
                    title: "Avengers"),
            
            Content(url: "https://zombie-film.com/serial-35423e-igra-prestolov-sezon-1",
                    title: "Game of thrones"),
            
            Content(url: "https://www.youtube.com/watch?v=bILE5BEyhdo",
                    title: "Detective Pikachu"),
            
            Content(url: "http://serialtime.net/2124-besstydniki-9-sezon.html",
                    title: "Shameless"),
            
            Content(url: "https://watchhowimetyourmother.online",
                    title: "How I met your mother")
        ]
    }
}
