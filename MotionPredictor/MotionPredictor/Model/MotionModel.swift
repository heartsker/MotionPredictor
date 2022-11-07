//
//  MotionModel.swift
//  MotionPredictor
//
//  Created by Daniil Pustotin on 07.11.2022.
//

import CoreMotion

final class MotionModel: CMMotionManager, ObservableObject {
    // MARK: - Properties

    @Published var attitude: Attitude = (pitch: 0.0, roll: 0.0, yaw: 0.0)
    @Published var gravity: Acceleration = (x: 0.0, y: 0.0, z: 0.0)
    @Published var rotationRate: RotationRate = (x: 0.0, y: 0.0, z: 0.0)
    @Published var userAcceleration: Acceleration = (x: 0.0, y: 0.0, z: 0.0)

    @Published private(set) var isRecording: Bool = false

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

    // MARK: - Methods

    func startRecording() {
        isRecording = true
    }

    func stopRecording() {
        isRecording = false
    }

    func exportData() -> URL? {
        guard let time = data.first?.timestamp.uptimeNanoseconds else {
            return nil
        }

        var dictionary: [Any] = []

        for item in data {
            var list: [String: Any] = [:]

            let attitude = [
                "pitch": item.attitude.pitch,
                "roll": item.attitude.roll,
                "yaw": item.attitude.yaw
            ]
            list["attitude"] = attitude

            let gravity = [
                "x": item.gravity.x,
                "y": item.gravity.y,
                "z": item.gravity.z
            ]
            list["gravity"] = gravity

            let rotationRate = [
                "x": item.rotationRate.x,
                "y": item.rotationRate.y,
                "z": item.rotationRate.z
            ]
            list["rotationRate"] = rotationRate

            let userAcceleration = [
                "x": item.userAcceleration.x,
                "y": item.userAcceleration.y,
                "z": item.userAcceleration.z
            ]
            list["userAcceleration"] = userAcceleration

            list["timestamp"] = time

            dictionary.append(list)
        }

        return JSONSerialization.save(jsonObject: dictionary, toFilename: time.description)
    }

    // MARK: - Private methods

    private func update(with motion: CMDeviceMotion) {
        attitude = (pitch: motion.attitude.pitch,
                    roll: motion.attitude.roll,
                    yaw: motion.attitude.yaw)

        gravity = (x: motion.gravity.x,
                   y: motion.gravity.y,
                   z: motion.gravity.z)

        rotationRate = (x: motion.rotationRate.x,
                        y: motion.rotationRate.y,
                        z: motion.rotationRate.z)

        userAcceleration = (x: motion.userAcceleration.x,
                            y: motion.userAcceleration.y,
                            z: motion.userAcceleration.z)

        if isRecording {
            recordData()
        }
    }

    private func recordData() {
        let record = (timestamp: DispatchTime.now(),
                      attitude: attitude,
                      gravity: gravity,
                      rotationRate: rotationRate,
                      userAcceleration: userAcceleration)
        data.append(record)
    }

    // MARK: - Private properties

    private var data: [MotionData] = []
}
