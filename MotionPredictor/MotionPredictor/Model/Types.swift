//
//  Types.swift
//  MotionPredictor
//
//  Created by Daniel Pustotin on 08.11.2022.
//

import Dispatch

typealias Coordinates = (x: Double, y: Double, z: Double)

typealias Attitude = (pitch: Double, roll: Double, yaw: Double)
typealias Acceleration = Coordinates
typealias RotationRate = Coordinates

typealias MotionData = (timestamp: DispatchTime,
                        attitude: Attitude,
                        gravity: Acceleration,
                        rotationRate: RotationRate,
                        userAcceleration: Acceleration)
