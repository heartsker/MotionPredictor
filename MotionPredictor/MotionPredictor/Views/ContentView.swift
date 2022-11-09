//
//  ContentView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Body

    var body: some View {
        TabView {
            RecordMotionView(motionModel: motionModel)
            .tabItem {
                VStack {
                    Image(systemName: "record.circle.fill")

                    Text("Record")
                }
            }

            TestMotionView()
            .tabItem {
                VStack {
                    Image(systemName: "testtube.2")

                    Text("Test")
                }
            }

        }
    }

    // MARK: - Private properties

    @StateObject private var motionModel: MotionModel = MotionModel()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
