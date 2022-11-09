//
//  RowView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct RowView: View {
    // MARK: - Properties

    let imageName: String
    let title: String
    let coordinates: Coordinates?

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: imageName)

            Text(title)
            
            Spacer()

            if let coordinates = coordinates {
                CoordinatesView(coordinates: coordinates)
            }
        }
    }
}

struct AccelerationRowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(imageName: "bolt.fill", title: "title", coordinates: (x: 0.5, y: 1.3, z: 2.5))
    }
}
