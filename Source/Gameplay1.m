//
//  Gameplay1.m
//  datinggame
//
//  Created by Mark on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay1.h"
#import "RoundEndPopup.h"

static const int maxTilesSelected = 30;

@implementation Gameplay1
{
    int gameTimer;
    int randomIndex;
    int tilesSelected;
    int responseTracker;
    
    BOOL isGameStarted;
    BOOL isGameEnded;
    BOOL isAnswerSelected;
    
    CCNode *_tile1;
    CCNode *_tile2;
    CCNode *_startButton;
    CCLabelTTF *_tileLabel;
    CCLabelTTF *_tileTimer;
    
    NSMutableArray *currentGameContent;
    NSMutableArray *usedContent;
    NSMutableArray *responses;
    NSArray *lines;
    
    NSString *path;
    NSString *allContent;
    NSString *selectedLine;
    
    CGPoint touchLocation;
}

#pragma mark - didLoadFromCCB

-(void)didLoadFromCCB
{
    // Enable touches
    self.userInteractionEnabled = YES;
    
    // Initialize arrays
    [self initArrays];
    
    // Prep Gameplay
    [self preStart];
}

#pragma mark - Update Method

-(void)update:(CCTime)delta
{
    // If start button is touched
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
        
        // If tileTimer is 0 or maximumTiles were selected, end the game
        if ((gameTimer == 0) || (tilesSelected >= maxTilesSelected))
        {
            isGameEnded = YES;
            if (isGameEnded)
            {
                [self endGame];
            }
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

// Initialize all arrays
-(void)initArrays
{
    lines = [[NSArray alloc] init];
    responses = [[NSMutableArray alloc] init];
    usedContent = [[NSMutableArray alloc] init];
    currentGameContent = [[NSMutableArray alloc] init];
}

// Before user clicks Start button
-(void)preStart
{
    // Set Timer and Tracker to initial value
    gameTimer = 1800;
    responseTracker = 0;
    
    // Hide game elements
    _tile1.visible = NO;
    _tile2.visible = NO;
    _tileLabel.visible = NO;
    
    // Read in content.txt and separate strings by new line
    path = [[NSBundle mainBundle] pathForResource:@"tileLabelContent" ofType:@"txt"];
    allContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    lines = [allContent componentsSeparatedByString:@"\n"];
    
    // Create a copy of all the content
    currentGameContent = [lines mutableCopy];
}

#pragma mark - Selector Methods

// If user clicks Start button
-(void)startGame
{
    // Set tileLabel to first random string
    randomIndex = arc4random() % [currentGameContent count];
    _tileLabel.string = currentGameContent[randomIndex];
    
    // Add that current string to usedContent
    [usedContent addObject:currentGameContent[randomIndex]];
    
    // Then remove that string to prevent repeats
    [currentGameContent removeObjectAtIndex:randomIndex];
    
    // Hide start button
    _startButton.visible = NO;
    
    // Make game elements hidden
    _tile1.visible = YES;
    _tile2.visible = YES;
    _tileLabel.visible = YES;
    
    // To test if game is started
    isGameStarted = YES;
}

// If game ends
-(void)endGame
{
    // Pause Game
    self.paused = YES;
    
    // Load the Round End Popup
    RoundEndPopup *endPopup = (RoundEndPopup *)[CCBReader load:@"RoundEndPopup"];
    endPopup.positionType = CCPositionTypeNormalized;
    endPopup.position = ccp(0.5,0.5);
    [self addChild:endPopup];
    
    // Debugging NSLog statements
//    NSLog(@"%@",usedContent);
//    NSLog(@"%lu",(unsigned long)[usedContent count]);
//    NSLog(@"%@",responses);
//    NSLog(@"%lu",(unsigned long)[responses count]);
    NSLog(@"Game Over, bitch.");
 
    // Hide game elements
    _tile1.visible = NO;
    _tile2.visible = NO;
    _tileLabel.visible = NO;
}

#pragma mark - Tile Handling

// If First Tile is Tapped
-(void)firstTile
{
    // Put "1" in responses array
    [responses addObject:@"1"];
    
    // Increment tilesSelected
    tilesSelected++;
    
    // Increment responseTracker
    responseTracker++;
    
    // Call Next Tile Method
    if ([usedContent count] != maxTilesSelected)
    {
        [self nextTileLabel];
    }
}

// If Second Tile is Tapped
-(void)secondTile
{
    // Put "0" is responses array
    [responses addObject:@"0"];
    
    // Increment tilesSelected
    tilesSelected++;
    
    // Increment responseTracker
    responseTracker++;
    
    // Call Next Tile Method
    if ([usedContent count] != maxTilesSelected)
    {
        [self nextTileLabel];
    }
}

// Go to next currentGameContent string
-(void)nextTileLabel
{
    // select a random index of that array and set the string
    randomIndex = arc4random() % [currentGameContent count];
    _tileLabel.string = currentGameContent[randomIndex];
    
    // Add that string to usedContent
    [usedContent addObject:currentGameContent[randomIndex]];
        
    // Then remove that string from the array to prevent duplicates
    [currentGameContent removeObjectAtIndex:randomIndex];
}

@end
