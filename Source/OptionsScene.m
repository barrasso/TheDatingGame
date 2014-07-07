//
//  OptionsScene.m
//  datinggame
//
//  Created by Mark on 7/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "OptionsScene.h"

@implementation OptionsScene

-(void)goBack
{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"MainScene"]];
}

@end
