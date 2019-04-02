//
//  PersonController.swift
//  Hybrid Star Wars Search
//
//  Created by Nelson Gonzalez on 4/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

@objc (NELPersonController)
class PersonController: NSObject {
    
    @objc (sharedController) static let shared = PersonController()
    
    private let baseUrl = URL(string: "https://swapi.co/api/people")!
    
    @objc func searchForPeople(with searchTerm: String, completion: @escaping([Person]?, Error?) -> Void) {
        
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        
        components?.queryItems = [URLQueryItem(name: "search", value: searchTerm)]
        
        guard let requestUrl = components?.url else {
            NSLog("Unable to create URL")
            completion(nil, NSError())
            return
        }
        
        URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            if let error = error {
                NSLog("Error searvhing for people: \(error)")
                completion(nil, error)
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                completion(nil, NSError())
                return
            }
            
            do {
                guard let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] /* a dict with string keys and any values */ else {
                    throw NSError()
                }
                
                guard let results = dict["results"] as? [[String: Any]] else {
                    throw NSError()
                }
                //same thing as for loop and returns some value
                let people = results.map({ Person(dictionary: $0)})
                
                completion(people, nil)
                
            }catch {
                NSLog("Unable to serialize json")
                return completion(nil, error)
            }
            
        }.resume()
    }
    
}
