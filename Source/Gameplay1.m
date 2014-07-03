//
//  Gameplay1.m
//  datinggame
//
//  Created by Mark on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay1.h"

// static const int maxTilesSelected = 30;

@implementation Gameplay1
{
    int gameTimer;
    
    BOOL isGameStarted;
    
    CCNode *_tile1;
    CCNode *_tile2;
    CCNode *_startButton;
    CCLabelTTF *_tileLabel;
    CCLabelTTF *_tileTimer;
    
    CGPoint touchLocation;
}

#pragma mark - didLoadFromCCB

-(void)didLoadFromCCB
{
    // Enable touches
    self.userInteractionEnabled = YES;
    
    // Prep Gameplay
    [self preStart];
    
    // Read in content.txt and update the tileLabel
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"txt"];
    NSString *allContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSArray *lines = [allContent componentsSeparatedByString:[NSCharacterSet newlineCharacterSet]];
    NSString *relevantLine = lines[0];
    
    NSLog(@"%@",relevantLine);
}

#pragma mark - Update Method

-(void)update:(CCTime)delta
{
    // If start button is clicked
    if(CGRectContainsPoint(_startButton.boundingBox, touchLocation))
    {
        // Start the game
        [self startGame];
    }
    
    // If the game is started
    if (isGameStarted)
    {
        // Start the countdown
        gameTimer--;
        
        // Update the tileTimer
        NSString *gameTimerString = [NSString stringWithFormat:@"%i",gameTimer/30];
        _tileTimer.string = gameTimerString;
        
        // If tileTimer is 0, end the game
        if (gameTimer == 0)
        {
            self.paused = YES;
        }
    }
}

#pragma mark - Touch Handling

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // Set touchLocation to coords of user touch
    touchLocation = [touch locationInNode:self];
}

#pragma mark - Helper Methods

// Before user clicks Start button
-(void)preStart
{
    // Set Timer to initial value
    gameTimer = 1800;
    
    // Hide game elements
    _tile1.visible = NO;
    _tile2.visible = NO;
    _tileLabel.visible = NO;
}

// After user clicks Start button
-(void)startGame
{
    // Set gameState to started
    
    // Hide start button
    _startButton.visible = NO;
    
    // Make game elements hidden
    _tile1.visible = YES;
    _tile2.visible = YES;
    _tileLabel.visible = YES;
    
    // To test if game is started
    isGameStarted = YES;
}

@end
