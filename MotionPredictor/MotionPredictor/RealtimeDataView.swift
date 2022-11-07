//
//  RealtimeDataView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct RealtimeDataView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Group {
                // MARK: Attitude
                AttitudeRowView(attitude: motionModel.attitude)
                Divider()

                // MARK: Gravity
                RowView(imageName: "figure.fall", title: "Gravity", coordinates: motionModel.gravity)
                Divider()

                // MARK: Heading
                HeadingRowView(heading: motionModel.heading)
                Divider()
            }
            Group {
                // MARK: Magnetic field
                RowView(imageName: "globe.europe.africa", title: "Magnetic field", coordinates: motionModel.magneticField)
                Divider()

                // MARK: Rotation rate
                RowView(imageName: "rotate.3d", title: "Rotation rate", coordinates: motionModel.rotationRate)
                Divider()

                // MARK: User acceleration
                RowView(imageName: "bolt.fill", title: "Acceleration", coordinates: motionModel.userAcceleration)
                Divider()
            }
        }
        .padding()
    }

    // MARK: - Private properties

    @StateObject private var motionModel: MotionModel = MotionModel()
}

struct RealtimeDataView_Previews: PreviewProvider {
    static var previews: some View {
        RealtimeDataView()
    }
}
