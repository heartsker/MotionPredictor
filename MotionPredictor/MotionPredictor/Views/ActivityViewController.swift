//
//  ActivityViewController.swift
//  MotionPredictor
//
//  Created by Daniel Pustotin on 08.11.2022.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    // MARK: - Properties

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    // MARK: - Methods
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
