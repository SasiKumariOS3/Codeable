//
//  HomeResponse.swift
//  MySampleExp
//
//  Created by sasi on 24/11/18.
//  Copyright © 2018 InfoWave. All rights reserved.
//

import Foundation


struct ResponseDTO {
    
    var resultCount : Int = 0
    var results = [Results]()
    
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}
extension ResponseDTO : Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decode(Int.self, forKey: .resultCount)
        results = try values.decode([Results].self, forKey: .results)
        
    }
}

struct Results {
    
    var wrapperType : String?
    var kind : String?
    var artistName : String?
    var collectionName : String?
    var trackName : String?
    var collectionCensoredName : String?
    var trackCensoredName : String?
    var collectionArtistName : String?
    var collectionArtistViewUrl : String?
    var artistViewUrl : String?
    var previewUrl : String?
    var artworkUrl100 : String?
    var releaseDate : String?
    var primaryGenreName : String?
    var country  : String?
    
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind, artistName, collectionName, trackName, collectionCensoredName, trackCensoredName, collectionArtistName, collectionArtistViewUrl, artistViewUrl, previewUrl, artworkUrl100, releaseDate, primaryGenreName, country
    }
}
extension Results : Decodable {
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
        collectionArtistName = try values.decodeIfPresent(String.self, forKey: .collectionArtistName)
        collectionArtistViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionArtistViewUrl)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        
    }
}
