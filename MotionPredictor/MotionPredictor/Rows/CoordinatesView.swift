//
//  CoordinatesView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct CoordinatesView: View {
    // MARK: - Properties

    let coordinates: Coordinates

    // MARK: - Body

    var body: some View {
        HStack {
            VStack {
                Text(String(describing: coordinates.x))
                Text("X")
            }
            VStack {
                Text(String(describing: coordinates.y))
                Text("Y")
            }
            VStack {
                Text(String(describing: coordinates.z))
                Text("Z")
            }
        }
    }
}

struct CoordinatesView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatesView(coordinates: (x: 0.5, y: 1.3, z: 2.5))
    }
}
