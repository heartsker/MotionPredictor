//
//  MotionDataView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct MotionDataView: View {
    // MARK: - Properties

    @ObservedObject var motionModel: MotionModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Group {
                // MARK: Attitude
                AttitudeRowView(attitude: motionModel.attitude)
                Divider()

                // MARK: Gravity
                RowView(imageName: "figure.fall", title: "Gravity", coordinates: motionModel.gravity)
                Divider()
            }
            Group {
                // MARK: Rotation rate
                RowView(imageName: "rotate.3d", title: "Rotation rate", coordinates: motionModel.rotationRate)
                Divider()

                // MARK: User acceleration
                RowView(imageName: "bolt.fill", title: "Acceleration", coordinates: motionModel.userAcceleration)
            }
        }
        .padding()
    }
}

struct MotionDataView_Previews: PreviewProvider {
    static var previews: some View {
        MotionDataView(motionModel: MotionModel())
    }
}
