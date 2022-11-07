//
//  HeadingRowView.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import SwiftUI

struct HeadingRowView: View {
    // MARK: - Properties

    let heading: Double?

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: "angle")

            Text("Heading")

            if let heading = heading {
                Text(String(describing: heading))
            }
        }
    }
}

struct HeadingRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingRowView(heading: 0.5)
    }
}
