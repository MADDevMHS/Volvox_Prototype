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
    
    //Score Label
    var scoreLabel:SKLabelNode = SKLabelNode(text: "0")
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //Setting Backgroud Color
        self.backgroundColor = SKColor.blackColor()
        //Setting name of the Parent node, which is the background
        self.name = "backGround"
        
        //Adding elements
        
        startGame()
        //createParticlesBackGround()
        createScoreLabel()
        
        
    }
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in (touches ) {
            
            //Circile appearing animation
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
            
            
            //When the user touches the screen, this method takes the location of the touch and check if there is any node in that location. 
            //If there is a node, if gameStarted boolean is true, the circle disappears and creates another cirlce.
            if(nodeAtPoint(touch.locationInNode(self)).isKindOfClass(SKSpriteNode)){
            
                if(gameStarted == true){
            
                        //Creates an object volvox of type SkSpriteNode
                        let volvox:SKSpriteNode = nodeAtPoint(touch.locationInNode(self)) as!SKSpriteNode
                
                        //
                        if(volvox.name == "name"){
                
                            volvox.removeFromParent()
                            gameStarted = false
                            startGame()
                        
                        }
                    
                }
            
            }
            
           //if gameStarted is false then check if the the name of the node is background or particles, and if that is true then run startGame
            else if(gameStarted == false)  {
            
                let volvox = nodeAtPoint(touch.locationInNode(self))
            
                if((volvox.name == "backGround") || (volvox.name == "particles"))
                {
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
    
    //Creating elements methods
    
    func createVolvox(){
        
        
        let circle1:SKSpriteNode = SKSpriteNode(imageNamed: "volvoxGreen.png")
        circle1.size = CGSizeMake(self.frame.size.width * 0.3, self.frame.size.width * 0.3) //setting the size of the circle
        
        circle1.position = CGPointMake((randomInt(0, max: self.frame.size.width)),(randomInt(0, max: self.frame.size.height))) //setting the coordinate of the circle at random coordinates
        circle1.name = "name"
        circle1.zPosition = 1
        self.addChild(circle1)
        
        let appearAnimation:SKAction = SKAction.scaleXBy(1.4, y: 1.4, duration: 0.007)
        let shirnkbackAnimation:SKAction = SKAction.scaleXBy(1, y: 1, duration: 0.01)
        
        let sequence:SKAction = SKAction.sequence([appearAnimation, shirnkbackAnimation])
        
        let makeSmallAnimation:SKAction = SKAction.scaleXTo(0, y: 0, duration: 0.9)
        
        let sequence1:SKAction = SKAction.sequence([sequence,makeSmallAnimation])
        
        circle1.runAction(sequence1) //last six lines deal with the animation sequence of the circle

        
    }
    
    func createParticlesBackGround(){
        
        //Particles and setting its position
        let particles:SKEmitterNode = SKEmitterNode(fileNamed: "Magic.sks")!
        particles.position = CGPointMake(self.frame.width * 0.9, self.frame.height * 0.9)
        particles.zPosition = 0
        particles.name = "particles"
        self.addChild(particles)
        
    }
    
    func createScoreLabel(){
        
        //Score Label setting its font color and position
        scoreLabel.fontColor = SKColor.whiteColor()
        scoreLabel.fontSize = 40
        scoreLabel.position = CGPointMake(self.frame.size.width*0.05, self.frame.size.height*0.95)
        self.addChild(scoreLabel)
        
    }
    
  
    
    
    override func update(currentTime: CFTimeInterval) {
        
        if(gameStarted == true){
         
            for node in self.children  {
                
                if(node.isKindOfClass(SKSpriteNode)) { //checking if node is SKSpriteNode
            
                    let spritenode = node as! SKSpriteNode
                
                    if((spritenode.size.width == 0) && (spritenode.size.height == 0)){
                
                        spritenode.removeFromParent() //if the coordinate of the node is 0, 0 then it will be removed from the parent
                        gameStarted = false //also gameStarted will be set to false
                
                    }
                    
                }
        
            }
            
        }
        
    }
    
    //Random float Value Generator
    
    /*func randomValueBetween(low:CGFloat, high:CGFloat) ->CGFloat {
        
        return (((CGFloat)(arc4random()) / 0xFFFFFFFF) * (high - low)) + low
        
    }*/

    func randomInt(min: CGFloat, max:CGFloat) -> CGFloat {
        return min + CGFloat(arc4random_uniform(UInt32(max - min + 1)))
    }
}

