//
//  FlyingMuseum.swift
//  Protocols Demo
//
//  Created by Israel Diaz de Leon on 02/03/26.
//

struct FlyingMuseum {
    func showFlyingDemo(flyingObjs: [CanFly]) {
        print("The flying demo begins...")
        for flyingItem in flyingObjs {
            flyingItem.fly()
        }
    }
}
