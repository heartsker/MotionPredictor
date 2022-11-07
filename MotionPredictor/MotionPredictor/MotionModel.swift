//
//  MotionModel.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import CoreMotion

final class MotionModel: CMMotionManager, ObservableObject {
    // MARK: - Properties

    @Published var attitude: CMAttitude = .init()
    @Published var gravity: CMAcceleration = .init()
    @Published var heading: Double = .init()
    @Published var magneticField: CMCalibratedMagneticField = .init()
    @Published var rotationRate: CMRotationRate = .init()
    @Published var userAcceleration: CMAcceleration = .init()

    var data: [String] {
        return [
            "Attitude: \(attitude)",
            "Gravity: \(gravity)",
            "Heading: \(heading)",
            "MagneticField: \(magneticField)",
            "RotationRate: \(rotationRate)",
            "UserAcceleration: \(userAcceleration)"
        ]
    }

    // MARK: - Constructor

    override init() {
        super.init()

        self.deviceMotionUpdateInterval = 0.1

        startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            guard let motion = motion, error == nil else {
                return
            }
            self?.update(with: motion)
        }
    }

    // MARK: - Private properties

    private func update(with motion: CMDeviceMotion) {
        attitude = motion.attitude
        heading = motion.heading
        magneticField = motion.magneticField
        rotationRate = motion.rotationRate
        userAcceleration = motion.userAcceleration
    }
}
