//
//  View.h
//  Nov01
//
//  Created by Kenneth David on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
    float scale;
    float factor;
    CGFloat xDir;
    CGFloat yDir;
    CGFloat xOffset;
    CGFloat yOffset;
    CGFloat xSpeed;
    CGFloat ySpeed;
    CGFloat rotateSpeed;
    CGFloat rotateDeg;
    CGFloat speedScale;
    CGFloat faceColorR;
    CGFloat faceColorG;
    CGFloat faceColorB;
    int rotationDir;
    
    
}

-(void)switchX;

-(void)switchY;

-(void)switchGrowth;

-(void)goLeft;

-(void)goRight;

-(void)goUp;

-(void)goDown;

-(void)switchRotation;

-(void)rotateClockwise;

-(void)rotateCounterClockwise;

-(void)changeSpeedBy:(CGFloat) scale;

@end
