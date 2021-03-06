//
//  MainScene.m
//  The Dating Game
//
//  Created by Mark on 07/02/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene {
    CCSprite *_optionsCog;
    CGPoint touchLocation;
}

#pragma mark - didLoadFromCCB

-(void)didLoadFromCCB
{
    // Enable touches
    self.userInteractionEnabled = YES;
}

#pragma mark - Update Method

-(void)update:(CCTime)delta
{

}

#pragma mark - Touch Handling

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    touchLocation = [touch locationInNode:self];
}

#pragma mark - Selector Methods

-(void)goToOptions
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"OptionsScene"]];
}

-(void)goToMatches
{
    
}

-(void)findNewGame
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"Gameplay1"]];
}

-(void)viewRecap
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"PostGameplay"]];
}

@end
