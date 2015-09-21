//
//  GameScene.swift
//  Volvox_0
//
//  Created by Steve Lee on 8/27/15.
//  Copyright (c) 2015 Steve Lee. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameStarted:Bool = false
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = SKColor.blackColor()
        self.name = "backGround"
        
        //Adding elements
        
        startGame()
        
        
        
    }
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in (touches ) {
        /*    let location = touch.locationInNode(self)
            
            let circle1:SKSpriteNode = SKSpriteNode(imageNamed: "Volvox_0")
            circle1.size = CGSizeMake(self.frame.size.width * 0.3, self.frame.size.width * 0.3)
            circle1.position = location
            self.addChild(circle1)
            
            let appearAnimation:SKAction = SKAction.scaleXBy(1.4, y: 1.4, duration: 0.007)
            let shirnkbackAnimation:SKAction = SKAction.scaleXBy(1, y: 1, duration: 0.01)
            
            let sequence:SKAction = SKAction.sequence([appearAnimation, shirnkbackAnimation])
            
            let makeSmallAnimation:SKAction = SKAction.scaleXTo(0, y: 0, duration: 0.7)
            
            let sequence1:SKAction = SKAction.sequence([sequence,makeSmallAnimation])
            
            circle1.runAction(sequence1)
            
            
            */
            
            if(nodeAtPoint(touch.locationInNode(self)).isKindOfClass(SKSpriteNode)){
            
                if(gameStarted == true){
            
                        let volvox:SKSpriteNode = nodeAtPoint(touch.locationInNode(self)) as!SKSpriteNode
                
                        if(volvox.name == "name"){
                
                            volvox.removeFromParent()
                            gameStarted = false
                            startGame()
                        
                        }
                    
                }
            
            }else if(gameStarted == false){
            
                let volvox = nodeAtPoint(touch.locationInNode(self))
            
                if(volvox.name == "backGround"){
                
                    startGame()
                
                }
            }
            
        }
        
        
    
    }
    
    func startGame(){
        
        createVolvox()
        gameStarted = true
        
    }
    
    func resetGame(){
        
        gameStarted = false
        
    }
    
    
    func createVolvox(){
        
        
        let circle1:SKSpriteNode = SKSpriteNode(imageNamed: "Volvox_0")
        circle1.size = CGSizeMake(self.frame.size.width * 0.3, self.frame.size.width * 0.3)
        circle1.position = CGPointMake((randomValueBetween(0, high: self.frame.size.width)), (randomValueBetween(0, high: self.frame.size.height)) )
        circle1.name = "name"
        self.addChild(circle1)
        
        let appearAnimation:SKAction = SKAction.scaleXBy(1.4, y: 1.4, duration: 0.007)
        let shirnkbackAnimation:SKAction = SKAction.scaleXBy(1, y: 1, duration: 0.01)
        
        let sequence:SKAction = SKAction.sequence([appearAnimation, shirnkbackAnimation])
        
        let makeSmallAnimation:SKAction = SKAction.scaleXTo(0, y: 0, duration: 0.9)
        
        let sequence1:SKAction = SKAction.sequence([sequence,makeSmallAnimation])
        
        circle1.runAction(sequence1)

        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        
        if(gameStarted == true){
         
            for node in self.children  {
            
                let spritenode = node as! SKSpriteNode
                
                if((spritenode.size.width == 0) && (spritenode.size.height == 0)){
                
                    spritenode.removeFromParent()
                    gameStarted = false
                
                }
            
        
            
            }
            
        }
        
    }
    
    //Random float Value Generator
    
    func randomValueBetween(low:CGFloat, high:CGFloat) ->CGFloat {
        
        return (((CGFloat)(arc4random()) / 0xFFFFFFFF) * (high - low)) + low
        
    }

    

  
}

