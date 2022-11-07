//
//  AttitudeRowView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct AttitudeRowView: View {
    // MARK: - Properties

    let attitude: Attitude?

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: "figure.dress.line.vertical.figure")

            Text("Attitude")

            if let attitude = attitude {
                VStack {
                    Text(String(describing: attitude.pitch))
                    Text("PITCH")
                }
                VStack {
                    Text(String(describing: attitude.roll))
                    Text("ROLL")
                }
                VStack {
                    Text(String(describing: attitude.yaw))
                    Text("YAW")
                }
            }
        }
    }
}

struct AttitudeRowView_Previews: PreviewProvider {
    static var previews: some View {
        AttitudeRowView(attitude: (pitch: 0.5, roll: 1.3, yaw: 2.5))
    }
}

