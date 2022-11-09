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
                Text(coordinates.x.description.prefix(7))
                Text("X")
            }
            Spacer()
            VStack {
                Text(coordinates.y.description.prefix(7))
                Text("Y")
            }
            Spacer()
            VStack {
                Text(coordinates.z.description.prefix(7))
                Text("Z")
            }
            Spacer()
        }
    }
}

struct CoordinatesView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatesView(coordinates: (x: 0.5, y: 1.3, z: 2.5))
    }
}
