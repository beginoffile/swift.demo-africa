//
//  CodableBundleExtension.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 20/03/24.
//

import Foundation


extension Bundle{
    func decode<T: Codable>(file: String) -> T{
        // 1 - Locate the JSOn file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle")
        }
        // 2 - Create a property  for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to locate \(file) from bundle.")
        }
        // 3 - Create a decoder
        let decoder  = JSONDecoder()
        // 4 - Create a property for the decode data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Fatal Error to decode \(file) from bundle")
        }
        // 5 - Return de Ready-to-use data
        return loaded
        
    }
}
