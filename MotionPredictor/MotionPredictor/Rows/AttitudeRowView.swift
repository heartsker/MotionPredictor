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

            Spacer()

            if let attitude = attitude {
                VStack {
                    Text(attitude.pitch.description.prefix(7))
                    Text("PITCH")
                }
                Spacer()
                VStack {
                    Text(attitude.roll.description.prefix(7))
                    Text("ROLL")
                }
                Spacer()
                VStack {
                    Text(attitude.yaw.description.prefix(7))
                    Text("YAW")
                }
                Spacer()
            }
        }
    }
}

struct AttitudeRowView_Previews: PreviewProvider {
    static var previews: some View {
        AttitudeRowView(attitude: (pitch: 0.5, roll: 1.3, yaw: 2.5))
    }
}

