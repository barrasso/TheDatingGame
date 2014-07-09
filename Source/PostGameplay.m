//
//  PostGameplay.m
//  datinggame
//
//  Created by Mark on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "PostGameplay.h"
#import "ResultsCostPopup.h"

@implementation PostGameplay

#pragma mark - Selectors

-(void)goToMain
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"MainScene"]];
}

-(void)goToResults
{
    // Load the Results Cost Popup
    ResultsCostPopup *costPopup = (ResultsCostPopup *)[CCBReader load:@"ResultsCostPopup"];
    costPopup.positionType = CCPositionTypeNormalized;
    costPopup.position = ccp(0.5,0.5);
    [self addChild:costPopup];
}

-(void)goToNewGame
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"Gameplay1"]];
}

@end
