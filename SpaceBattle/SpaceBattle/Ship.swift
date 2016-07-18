//
//  Drawable.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 24/06/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class Ship {
    let node : SKNode
    let distance : CGFloat
    let PI = CGFloat(M_PI)
    var target: Ship?
    var shooting = false
    
    init (name: String, x: CGFloat, y: CGFloat, scale: CGFloat) {
        let shipObject = SpaceObjectFactory.createShip();
        node = shipObject.create("gameScene", name: name, position: CGPoint(x: x, y: y), rotation: 0, xScale: scale, yScale: scale)
        distance = 500
    }
    
    public func isAlive() -> Bool {
        return true;
    }
    
    public func name() -> String {
        return node.name!
    }
    
    public func draw(scene: SKScene) {
        scene.addChild(node)
    }
    
    public func rotate() {
        let action = SKAction.rotateByAngle(PI, duration:10)
        
        node.runAction(SKAction.repeatActionForever(action))
    }
    
    public func collide(projectileNode: SKShapeNode) {
        
    }
    
    public func target(scene: SKScene, target: CGPoint) {
//        self.target = target
//        test(0, y: 0)
//        test(10, y: 0)
//        test(0, y: 10)
//        test(10, y: 10)
//        test(-10, y: 0)
//        test(0, y: -10)
//        test(-10, y: 10)
//        test(10, y: -10)
//        test(-10, y: 0)
//        test(-10, y: -10)
        if (!shooting) {
            let qualityOfServiceClass = QOS_CLASS_BACKGROUND
            let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
            shooting = true;
            dispatch_async(backgroundQueue, {
                print("This is run on the background queue")
                let rotation = self.getRotation(self.node.position, endingPoint: target)// * -1
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    print("Rotating")
                    NSLog("by: %f", rotation);
                    NSLog("z: %f", Float(self.node.zRotation));
                    let vysledek = rotation - Float(self.node.zRotation)
                    NSLog("vysledek: %f", vysledek);
                    //self.shoot(scene, direction: target.node.position)
                    
                    let action = SKAction.rotateByAngle(CGFloat(vysledek), duration:1)
                    self.node.runAction(action, completion: {
                        print("Completed")

                        var counter = 5
                        while(counter > 0) {
                            //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                print("Shooting")
                                //self.shoot(scene, direction: target.node.position)
                                self.shoot(scene)
                            //})
                            sleep(2)
                            counter -= 1
                        }
                    })
                    //self.shoot(scene)
                })
                //self.target = nil
                self.shooting = false;
            })
        }
     }
    
    public func shoot(scene: SKScene, direction: CGPoint) {
        NSLog("%f",node.zRotation);
        let projectileObject = SpaceObjectFactory.createProjectile();
        let projectile = projectileObject.create(name(), name: "projectile", position: node.position, rotation: node.zRotation, xScale: node.xScale, yScale: node.yScale)
        
        // 5 - OK to add now - you've double checked position
        scene.addChild(projectile)
        
        
        // 9 - Create the actions
        let actionMove = SKAction.moveTo(direction, duration: 5.0)
        let actionMoveDone = SKAction.removeFromParent()
        projectile.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    public func shoot(scene: SKScene) {
        shoot(scene, direction: finalPosition())
    }
    
    func finalPosition() -> CGPoint {
        let rotation = node.zRotation + PI/2
        let normalizedX = cos(rotation)
        let normalizedY = sin(rotation)
        
        NSLog("normalizedX: %f",normalizedX);
        let x = distance * normalizedX;
        let y = distance * normalizedY;
        var newPosition = node.position;
        newPosition.x += x;
        newPosition.y += y;
        return newPosition
    }
    func test(x: Float, y: Float) {
        let bearingRadians = atan2f(x, y); // get bearing in radians
        NSLog("Origin point X: %f",x);
        NSLog("Origin point Y: %f",y);
        NSLog("Radians: %f",bearingRadians);

    }
    func getRotation(startingPoint: CGPoint, endingPoint: CGPoint) -> Float {
        let originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y); // get origin point to origin by subtracting end from start
        
        //NSLog("Origin point X: %f",originPoint.x);
        //NSLog("Origin point Y: %f",originPoint.y);
        //let tanValue = originPoint.x/originPoint.y;
        //let radians = atan(Float(tanValue))
        let bearingRadians = atan2f(Float(originPoint.x), Float(originPoint.y)); // get bearing in radians
        //let bearingDegrees = bearingRadians * (180.0 / M_PI); // convert to degrees
        //bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees)); // correct discontinuity
        //return bearingDegrees;
        //NSLog("Radians: %f",bearingRadians);
        //NSLog("My Radians: %f", radians);
        //NSLog("Current position: %f",node.zRotation);
        return bearingRadians * -1
    }
}

