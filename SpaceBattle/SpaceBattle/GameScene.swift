//
//  GameScene.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 24/06/16.
//  Copyright (c) 2016 Vojtech Smrček. All rights reserved.
//

import SpriteKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ships = [String: Ship]()
    var mainShip: Ship? = nil
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!"
        //myLabel.fontSize = 45
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
        //self.addChild(myLabel)
        let name1 = "ship1"
        let name2 = "ship2"
        let name3 = "ship3"
        ships[name1] = Ship(name: name1, x: self.frame.width/2, y: self.frame.height/2, scale: CGFloat(0.15))
        ships[name2] = Ship(name: name2, x: self.frame.width/3, y: self.frame.height/3, scale: CGFloat(0.15))
        ships[name3] = Ship(name: name3, x: self.frame.width/1.5, y: self.frame.height/1.5, scale: CGFloat(0.15))
        mainShip = ships[name1]
        for (_, ship) in ships {
            ship.draw(self)
        }
        //mainShip!.rotate()
        //self.addChild(ship.draw())
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first!
        
        let touchLocation = touch.locationInNode(self)
        //var selected = false
        mainShip!.target(self, target: touchLocation)
        /*
        for (_, ship) in ships {
            if (ship.node.containsPoint(touchLocation)) {
                if (mainShip!.name() == ship.name()) {
                    //mainShip = ship
                    selected = true
                } else {
                    mainShip!.target(self, target: ship)
                }
            }
        }
        */
        //if (mainShip != nil && !selected) {
            //mainShip!.shoot(self)
        //}
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.Ship != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Projectile != 0)) {
            collide(firstBody.node as! SKSpriteNode, projectile: secondBody.node as! SKShapeNode)
        }
    }
    
    func collide(shipNode:SKSpriteNode, projectile:SKShapeNode) {
        let projectileParentName = projectile.userData![ProjectileConstants.PARENT]!
        if projectileParentName is String {
            let shipName = shipNode.name!
            if projectileParentName as! String != shipName {
                print("Hit")
                let ship = ships[shipName]!
                ship.collide(projectile)
            } else {
                print("Self Hit")
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
