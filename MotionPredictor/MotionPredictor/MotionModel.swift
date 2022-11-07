//
//  MotionModel.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import CoreMotion

typealias Attitude = (pitch: Double, roll: Double, yaw: Double)
typealias Coordinates = (x: Double, y: Double, z: Double)
typealias Acceleration = Coordinates
typealias MagneticField = Coordinates
typealias RotationRate = Coordinates

final class MotionModel: CMMotionManager, ObservableObject {
    // MARK: - Properties

    @Published var attitude: Attitude?
    @Published var gravity: Acceleration?
    @Published var heading: Double?
    @Published var magneticField: MagneticField?
    @Published var rotationRate: RotationRate?
    @Published var userAcceleration: Acceleration?

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
        attitude = (pitch: motion.attitude.pitch,
                    roll: motion.attitude.roll,
                    yaw: motion.attitude.yaw)

        gravity = (x: motion.gravity.x,
                   y: motion.gravity.y,
                   z: motion.gravity.z)

        heading = motion.heading

        magneticField = (x: motion.magneticField.field.x,
                         y: motion.magneticField.field.y,
                         z: motion.magneticField.field.z)

        rotationRate = (x: motion.rotationRate.x,
                        y: motion.rotationRate.y,
                        z: motion.rotationRate.z)

        userAcceleration = (x: motion.userAcceleration.x,
                            y: motion.userAcceleration.y,
                            z: motion.userAcceleration.z)
    }
}
