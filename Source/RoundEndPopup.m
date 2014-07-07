//
//  RoundEndPopup.m
//  datinggame
//
//  Created by Mark on 7/7/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "RoundEndPopup.h"

@implementation RoundEndPopup

// Main Screen selector
-(void)goToMain
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"MainScene"]];
}

// See Results selector
-(void)seeResults
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"ResultsScene"]];
}

@end
