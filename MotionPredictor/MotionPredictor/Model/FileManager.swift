//
//  FileManager.swift
//  MotionPredictor
//
//  Created by Daniel Pustotin on 08.11.2022.
//

import Foundation

extension JSONSerialization {
    // MARK: Type methods
    
    static func save(jsonObject: Any, toFilename filename: String) -> URL? {

        guard let url = try? FileManager.default.url(for: .documentDirectory,
                                                     in: .userDomainMask,
                                                     appropriateFor: nil,
                                                     create: true) else {
            return nil
        }
        
        var fileURL = url.appendingPathComponent(filename)
        fileURL = fileURL.appendingPathExtension("json")
        do {

            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: fileURL, options: [.atomicWrite])
        } catch {
            return nil
        }

        return fileURL
    }
}
