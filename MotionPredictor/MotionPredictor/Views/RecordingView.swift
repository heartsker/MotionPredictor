//
//  RecordingView.swift
//  MotionPredictor
//
//  Created by Daniel Pustotin on 07.11.2022.
//

import SwiftUI

struct RecordingView: View {
    // MARK: - Properties

    @ObservedObject var motionModel: MotionModel

    // MARK: - Body

    var body: some View {
        HStack {
            Text(motionModel.isRecording ? "Tap to stop" : "Tap to record")
                .font(.title)
                .padding()

            ZStack {
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.primary)
                    .frame(width: sizeBig, height: sizeBig)

                if motionModel.isRecording {
                    Image(systemName: "square.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: sizeSmall, height: sizeSmall)
                } else {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: sizeSmall, height: sizeSmall)
                }
            }

            .onTapGesture {
                if motionModel.isRecording {
                    motionModel.stopRecording()
                } else {
                    motionModel.startRecording()
                }
                sheetShowing = !motionModel.isRecording
            }
        }
        .sheet(isPresented: $sheetShowing, onDismiss: {
            print("Dismiss")
        }, content: {
            ActivityViewController(activityItems: [
                motionModel.exportData() as Any
            ])
        })
    }

    // MARK: - Private properties

    private let sizeBig: Double = 100.0
    private let sizeSmall: Double = 50.0
    @State private var sheetShowing: Bool = false
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView(motionModel: MotionModel())
    }
}
