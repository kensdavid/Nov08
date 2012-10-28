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
    CGFloat rotateDeg;
    int dir;
}

@end
