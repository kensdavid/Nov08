//
//  View.m
//  Nov01
//
//  Created by Kenneth David on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        //Keep the size of the view the same,
		//but let the center of the view be the origin.
		/*
        CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
         */
        scale = 1;
        factor = .001;
        xDir = 1;
        yDir = 1;
        xOffset = 0;
        yOffset = 0;
        xSpeed = .15;
        ySpeed = .15;
        rotateDeg = 0;
        dir = 1; //clockwise direction
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    NSLog(@"self.frame == (%g, %g), %g × %g",
          self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height
          );
    
	NSLog(@"self.bounds == (%g, %g), %g × %g",
          self.bounds.origin.x,
          self.bounds.origin.y,
          self.bounds.size.width,
          self.bounds.size.height
          );
    
    // Drawing code
    CGRect bounds = self.bounds;
    /*CGFloat rightEdge = bounds.size.width / 2; //After translate
    CGFloat leftEdge = - bounds.size.width / 2; //After translate
    CGFloat topEdge = - bounds.size.height / 2; //After translate
    CGFloat bottomEdge = bounds.size.height / 2; //After translate
    */
    CGFloat rightEdge = bounds.size.width; //After translate
    CGFloat leftEdge = 0; //After translate
    CGFloat topEdge = 0; //After translate
    CGFloat bottomEdge = bounds.size.height; //After translate

    CGFloat radius = .3 * bounds.size.width;	//in pixels
    CGFloat scaledRadius = scale * radius;
    rotateDeg += .1 * dir;
    
    //Create a rect for the large circle
    CGRect r = CGRectMake(
                          - radius,
                          - radius,
                          2 * radius,
                          2 * radius
                          );

    
    CGRect eye1 = CGRectMake(-radius / 2,
                             -radius / 2,
                             .2 * radius,
                             .2 * radius);
    CGRect eye2 = CGRectMake(radius / 2 - .2 * radius,
                             -radius / 2,
                             .2 * radius,
                             .2 * radius);
    
    //Translate the drawing context so that it moves relative to the size of the screen and the xOffset and yOffset
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(c, bounds.size.width / 2 + xOffset, bounds.size.height / 2 + yOffset);
    CGContextRotateCTM(c, rotateDeg * M_PI / 180);
    CGContextScaleCTM(c, scale, scale);
    
    //Add a shadow for the large yellow circle
    CGContextSetShadow(c, CGSizeMake(10, 20), 5);
    
    //Create the face using a yellow circle
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, 1.0, 1.0, 0.0, 1.0);	//yellow, opaque
    CGContextFillPath(c);
    
    //Create 2 black eyes using circles
    CGContextBeginPath(c);
    //Remove the shadow for the resto of the objects
    CGContextSetShadow(c, CGSizeMake(0, 0), 0);
    CGContextAddEllipseInRect(c, eye1);
    CGContextAddEllipseInRect(c, eye2);
    CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 1.0);	//black, opaque
    CGContextFillPath(c);
    
    //Create the mouth using an arc, filled in
    CGContextBeginPath(c);
    CGContextAddArc(c, 0, 0, .8 * radius, 0, M_PI, 0);
    CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 1.0);	//black, opaque
    CGContextClosePath(c);
    CGContextFillPath(c);
    
    //Grow by the factor
    scale += factor;
    
    //Change growth to shrinking, and back
    if(scale > 1.2 || scale < .1){
        factor *= -1;
        //Switch rotation direction on bounce
        if (scale < .8) {
            dir *= -1;
        }        
    }
    
    //If the edges of the large circle hit the edge of the screen,
    //switch directions (bounce)
    if(bounds.size.width / 2 + xOffset - scaledRadius + 2 * scaledRadius >= rightEdge) {
        //NSLog(@"Go left!");
        xDir = -1;
    }
    if(bounds.size.width / 2 + xOffset -scaledRadius <= leftEdge) {
        //NSLog(@"Go right!");
        xDir = 1;
    }
    if(bounds.size.height / 2 + yOffset -scaledRadius <= topEdge) {
        //NSLog(@"Go down!");
        yDir = 1;
    }
    if(bounds.size.height / 2 + yOffset -scaledRadius + 2 * scaledRadius >= bottomEdge) {
        //NSLog(@"Go up!");
        yDir = -1;
    }
    
    //Change the position on the screen
    xOffset += xDir * xSpeed;
    yOffset += yDir * ySpeed;
    
    
    [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: .002];
    
}


@end
