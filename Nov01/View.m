//
//  View.m
//  Nov01
//
//  Created by Kenneth David on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
static CGFloat xSpeed;
static CGFloat ySpeed;
static CGFloat rotateSpeed;
static CGFloat scale = 1;
static CGFloat speedScale = 1;
static CGFloat factor;
static CGFloat xDir = 1;
static CGFloat yDir = 1;
static CGFloat xOffset = 0;
static CGFloat yOffset = 0;
static CGFloat xSpeed;
static CGFloat ySpeed;
static CGFloat rotateSpeed;
static CGFloat rotateDeg = 0;
static int rotationDir = 1; //clockwise direction
static CGFloat faceColorR = 1.0;
static CGFloat faceColorG = 1.0;
static CGFloat faceColorB = 0.0;
static CGFloat rColor = 1.0;
static CGFloat gColor = 1.0;
static CGFloat bColor = 1.0;
static int stopOrGo = 1;

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:rColor green:gColor blue:bColor alpha:1.0];
        NSLog(@"%g", rColor);
        //Keep the size of the view the same,
		//but let the center of the view be the origin.
		/*
        CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
         */
        factor = .001 * speedScale;
        xSpeed = .15 * speedScale;
        ySpeed = .15 * speedScale;
        [View setRotateSpeed:.1 * speedScale];
        
        static const UISwipeGestureRecognizerDirection a[] = {
			UISwipeGestureRecognizerDirectionRight,
			UISwipeGestureRecognizerDirectionLeft,
			UISwipeGestureRecognizerDirectionUp,
			UISwipeGestureRecognizerDirectionDown
		};
		const size_t n = sizeof a / sizeof a[0];
        
		for (size_t i = 0; i < n; ++i) {
			UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                    initWithTarget: self action: @selector(swipe:)
                                                    ];
            
			recognizer.direction = a[i];
			[self addGestureRecognizer: recognizer];
		}
        
        UIRotationGestureRecognizer *rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
        [self addGestureRecognizer: rotateRecognizer];
        
        UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(pinch:)
                                                ];
        [self addGestureRecognizer: recognizer];
        

    }
    return self;
}

+(CGFloat)xSpeed {
    return xSpeed;
}
+(void)setXSpeed: (CGFloat) newXSpeed {
    xSpeed = newXSpeed;
}

+(CGFloat)ySpeed {
    return ySpeed;
}
+(void)setYSpeed: (CGFloat) newYSpeed {
    ySpeed = newYSpeed;
}

+(CGFloat) rotateSpeed{
    return rotateSpeed;
}

+(void) setRotateSpeed: (CGFloat) newRSpeed {
    rotateSpeed = newRSpeed;
}

+(int) stopOrGo {
    return stopOrGo;
}

+(void)switchStopOrGo{
    if(stopOrGo == 1){
        stopOrGo = 0;
    }
    else {
        stopOrGo = 1;
    }
}

+(void) onOffRotate {
    if(rotateSpeed > 0){
        [View setRotateSpeed:0];
    }
    else{
        [View setRotateSpeed:.1 * speedScale];
    }
}

+(CGFloat) scale{ return scale; }
+(CGFloat) speedScale{ return speedScale; }
+(CGFloat) factor;{ return factor; }
+(CGFloat) xDir{ return xDir; }
+(CGFloat) yDir{ return yDir; }
+(CGFloat) xOffset{ return xOffset; }
+(CGFloat) yOffset{ return yOffset; }
+(CGFloat) rotateDeg{ return rotateDeg; }
+(int) rotationDir{ return rotationDir; }
+(CGFloat) faceColorR{ return faceColorR; }
+(CGFloat) faceColorG{ return faceColorG; }
+(CGFloat) faceColorB{ return faceColorB; }
+(CGFloat) rColor{ return rColor; }
+(CGFloat) gColor{ return gColor; }
+(CGFloat) bColor{ return bColor; }

+(void) setRColor: (CGFloat) newRColor {
    rColor = newRColor;
}
+(void) setGColor: (CGFloat) newGColor {
    gColor = newGColor;
}
+(void) setBColor: (CGFloat) newBColor {
    bColor = newBColor;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	
    faceColorG = 0.0;
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	//littleView.center = [[touches anyObject] locationInView: self];
    faceColorG = 1.0;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	//littleView.backgroundColor = [UIColor yellowColor];
    [self switchGrowth];
    //self.backgroundColor = [UIColor whiteColor];
    faceColorG = 1.0;
}

- (void) switchX {
    xDir *= -1;
    return;
}

- (void) switchY {
    yDir *= -1;
    return;
}

- (void) switchGrowth {
    factor *= -1;
    return;
}

- (void) goLeft {
    xDir = -1;
    return;
}

- (void) goRight {
    xDir = 1;
    return;
}

- (void) goUp {
    yDir = -1;
    return;
}

- (void) goDown {
    yDir = 1;
    return;
}

- (void) switchRotation {
    rotationDir *= -1;
    return;
}

- (void) rotateClockwise {
    rotationDir = 1;
    return;
}

- (void) rotateCounterClockwise {
    rotationDir = -1;
    return;
}

- (void) changeSpeedBy:(CGFloat) speedChange {
    speedScale *= speedChange;
    if(speedScale >= 3)
        speedScale = 3;
    if(speedScale <= .5)
        speedScale = .5;
    rotateSpeed = .1 * speedScale;
    xSpeed = .15 * speedScale;
    ySpeed = .15 * speedScale;
}


- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		//direction = @"→";
        [self goRight];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		//direction = @"←";
        [self goLeft];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		//direction = @"↑";
        [self goUp];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		//direction = @"↓";
        [self goDown];
	} 
   	//faceColorG = 1.0;
}

- (void) rotation: (UIRotationGestureRecognizer *) recognizer {
    if(recognizer.rotation > 0) {
        [self rotateClockwise];
    }
    else if(recognizer.rotation < 0){
        [self rotateCounterClockwise];
    }
    //faceColorG = 1.0;
}

- (void) pinch: (UIPinchGestureRecognizer *) recognizer {
    
    [self changeSpeedBy:recognizer.velocity];
    //faceColorG = 1.0;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    /*NSLog(@"self.frame == (%g, %g), %g × %g",
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
          );*/
    
    // Drawing code
    self.backgroundColor = [UIColor colorWithRed:rColor green:gColor blue:bColor alpha:1.0];
    //NSLog(@"%g", rColor);
    
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
    rotateDeg += rotateSpeed * rotationDir;
    
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
    CGContextSetRGBFillColor(c, faceColorR, faceColorG, faceColorB, 1.0);	//yellow, opaque
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
    scale += factor * stopOrGo;
    
    //Change growth to shrinking, and back
    if(scale > 1.2 || scale < .1){
        [self switchGrowth];
        //Switch rotation direction on bounce
        if (scale < .8) {
            [self switchRotation];
        }        
    }
    
    //If the edges of the large circle hit the edge of the screen,
    //switch directions (bounce)
    if(bounds.size.width / 2 + xOffset - scaledRadius + 2 * scaledRadius >= rightEdge) {
        //NSLog(@"Go left!");
        [self goLeft];
    }
    if(bounds.size.width / 2 + xOffset -scaledRadius <= leftEdge) {
        //NSLog(@"Go right!");
        [self goRight];
    }
    if(bounds.size.height / 2 + yOffset -scaledRadius <= topEdge) {
        //NSLog(@"Go down!");
        [self goDown];
    }
    if(bounds.size.height / 2 + yOffset -scaledRadius + 2 * scaledRadius >= bottomEdge) {
        //NSLog(@"Go up!");
        [self goUp];
    }
    
    //Change the position on the screen
    xOffset += xDir * xSpeed;
    yOffset += yDir * ySpeed;
    
    
    [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: .002];
    
}



@end
