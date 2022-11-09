//
//  RecordMotionView.swift
//  MotionPredictor
//
//  Created by Daniel Pustotin on 08.11.2022.
//

import SwiftUI

struct RecordMotionView: View {
    // MARK: - Properties

    @ObservedObject var motionModel: MotionModel

    // MARK: - Body
    var body: some View {
        VStack {
            RecordingView(motionModel: motionModel)

            MotionDataView(motionModel: motionModel)
        }
    }
}

struct RecordMotionView_Previews: PreviewProvider {
    static var previews: some View {
        RecordMotionView(motionModel: MotionModel())
    }
}
