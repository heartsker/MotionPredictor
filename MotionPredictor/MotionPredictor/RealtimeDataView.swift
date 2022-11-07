//
//  RealtimeDataView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct RealtimeDataView: View {

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(motionModel.data, id: \.self) { string in
                Text(string)
                    .bold()
                    .padding()
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
