//
//  Track.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation

// TODO: Pt 1 - Create a Track model struct
struct Track: Decodable {
    let original_title: String
    let overview: String
    let popularity: Double
    let vote_average: Double
    let vote_count: Int
    let poster_path: String
    let backdrop_path: String
}
struct TracksResponse: Decodable {
    let results: [Track]
}

// TODO: Pt 1 - Create an extension with a mock tracks static var
extension Track {
//    static var mockTracks: [Track] = [
//        Track(original_title: "Black Panther: Wakanda Forever",
//            overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
//              popularity: "4646.778",
//              vote_average: "7.5",
//            vote_count: "3132",
//            poster_path: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
//              backdrop_path: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg"),
//        Track(original_title: "Plane",
//            overview: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
//              popularity: "3876.073",
//              vote_average: "6.7",
//            vote_count: "412",
//            poster_path: URL(string: "https://image.tmdb.org/t/p/w200/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")!,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w400/9Rq14Eyrf7Tu1xk0Pl7VcNbNh1n.jpg")!),
//        Track(original_title: "Puss in Boots: The Last Wish",
//            overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
//              popularity: "2746.198",
//              vote_average: "8.5",
//            vote_count: "3689",
//            poster_path: URL(string: "https://image.tmdb.org/t/p/w200/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w400/tGwO4xcBjhXC0p5qlkw37TrH6S6.jpg")!),
//        Track(original_title: "Shotgun Wedding",
//            overview: "Darcy and Tom gather their families for the ultimate destination wedding but when the entire party is taken hostage, “’Til Death Do Us Part” takes on a whole new meaning in this hilarious, adrenaline-fueled adventure as Darcy and Tom must save their loved ones—if they don’t kill each other first.",
//              popularity: "2133.751",
//              vote_average: "6.3",
//            vote_count: "430",
//            poster_path: URL(string: "https://image.tmdb.org/t/p/w200/t79ozwWnwekO0ADIzsFP1E5SkvR.jpg")!,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w400/t72ZvOZwtvcjZivZCFtCtL8QWb0.jpg")!),
//        Track(original_title: "M3GAN",
//            overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
//              popularity: "1469.244",
//              vote_average: "7.5",
//            vote_count: "1580",
//            poster_path: URL(string: "https://image.tmdb.org/t/p/w200/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w400/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg")!)
//    ]
}


// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
