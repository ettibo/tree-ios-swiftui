// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let records: [Record]
}

// MARK: - Record
struct Record: Codable {
    let recordid: String
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable {
    let hauteurenm: Int
    let libellefrancais: String?
    let idemplacement: String?
    let circonferenceencm: Int
    let geoPoint2D: [Double]?
    let espece: String?
    let genre: String?
    let adresse: String?
    let stadedeveloppement: String?
    let domanialite: String?
    let remarquable: String?
    let idbase: Int
    let arrondissement: String?
    let varieteoucultivar: String?
}


// MARK: - Geometry
struct Geometry: Codable {
    let coordinates: [Double]
}

extension Fields: DataToDomain {
    func ToDomain() -> Any {
        Tree(id: idbase,
             hauteurenm: hauteurenm,
             libellefrancais: libellefrancais,
             circonferenceencm: circonferenceencm,
             espece: espece,
             genre: genre,
             adresse: adresse,
             arrondissement: arrondissement,
             varieteoucultivar: varieteoucultivar)
    }
}
