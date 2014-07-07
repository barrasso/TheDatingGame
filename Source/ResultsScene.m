//
//  ResultsScene.m
//  datinggame
//
//  Created by Mark on 7/7/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ResultsScene.h"
#import "ResultsCostPopup.h"

@implementation ResultsScene

-(void)unlockResults
{
    // Load the Results Cost Popup
    ResultsCostPopup *costPopup = (ResultsCostPopup *)[CCBReader load:@"ResultsCostPopup"];
    costPopup.positionType = CCPositionTypeNormalized;
    costPopup.position = ccp(0.5,0.5);
    [self addChild:costPopup];
}

-(void)goBack
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"MainScene"]];
}

@end
