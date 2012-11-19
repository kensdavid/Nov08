//
//  ControlView.m
//  Nov08
//
//  Created by Ken David on 11/18/12.
//
//

#import "ControlView.h"
#import "View.h"

@implementation ControlView

- (void) xValueChanged: (id) sender {
	UISlider *s = sender;
    
	float red = (s.value - s.minimumValue)
    / (s.maximumValue - s.minimumValue);
    
	xSpeedSlider.backgroundColor = [UIColor colorWithRed:
                              red green: 0.0 blue: 1.0 - red alpha: 1.0];
    
    [View setXSpeed:xSpeedSlider.value * .15];
    
	xSpeedLabel.text = [NSString stringWithFormat: @"X-Speed: %1.1fx",
                  xSpeedSlider.value];
}

- (void) yValueChanged: (id) sender {
	UISlider *s = sender;
    
	float red = (s.value - s.minimumValue)
    / (s.maximumValue - s.minimumValue);
    
	ySpeedSlider.backgroundColor = [UIColor colorWithRed:
                                    red green: 0.0 blue: 1.0 - red alpha: 1.0];
    
    [View setYSpeed:ySpeedSlider.value * .15];
    
	ySpeedLabel.text = [NSString stringWithFormat: @"Y-Speed: %1.1fx",
                        ySpeedSlider.value];
}

-(void)rColorChanged: (id) sender {
    UISlider *s = sender;
    [View setRColor:s.value];
    rColorLabel.text = [NSString stringWithFormat: @"R:%1.1f",
                       rColorSlider.value];
    rColorSlider.backgroundColor = [UIColor colorWithRed: rColorSlider.value green: 0.0 blue: 0.0 alpha: 1.0];
}
-(void)gColorChanged: (id) sender {
    UISlider *s = sender;
    [View setGColor:s.value];
    gColorLabel.text = [NSString stringWithFormat: @"G:%1.1f",
                        gColorSlider.value];
    gColorSlider.backgroundColor = [UIColor colorWithRed: 0.0 green: gColorSlider.value blue: 0.0 alpha: 1.0];
}
-(void)bColorChanged: (id) sender {
    UISlider *s = sender;
    [View setBColor:s.value];
    bColorLabel.text = [NSString stringWithFormat: @"B:%1.1f",
                        bColorSlider.value];
    bColorSlider.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.0 blue: bColorSlider.value alpha: 1.0];
}

- (void) rotateSwitchValueChanged: (id) sender {
    //UISwitch *s = sender;
    [View onOffRotate];
}

-(void) bounceSwitchValueChanged: (id) sender {
    [View switchStopOrGo];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        self.backgroundColor = color;
        float minimumValue = 0;	
		float maximumValue = 5;
        
		//Center the x-speed slider in the View.
		CGRect b = CGRectMake(
                              self.bounds.origin.x + self.bounds.size.width * .05,
                              self.bounds.origin.y,
                              self.bounds.size.width,
                              self.bounds.size.height
                              );
		CGSize itemSize = CGSizeMake(b.size.width * .4, 16);
        
		CGRect f = CGRectMake(
                              b.origin.x,
                              b.origin.y + itemSize.height * 1,
                              itemSize.width,
                              itemSize.height
                              );
        
		xSpeedSlider = [[UISlider alloc] initWithFrame: f];
		xSpeedSlider.minimumValue = minimumValue;
		xSpeedSlider.maximumValue = maximumValue;
		xSpeedSlider.value = [View xSpeed] / .15;
		xSpeedSlider.continuous = YES;	//default is YES
        
		//As the slider goes from the minimum to the maximum value,
		//red goes from 0 to 1.  Conversely, blue goes from 1 to 0.
        
		CGFloat red = (xSpeedSlider.value - xSpeedSlider.minimumValue)
        / (xSpeedSlider.maximumValue - xSpeedSlider.minimumValue);
        
		xSpeedSlider.backgroundColor = [UIColor colorWithRed:
                                  red green: 0.0 blue: 1.0 - red alpha: 1.0];
        
		[xSpeedSlider addTarget:self
                   action: @selector(xValueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: xSpeedSlider];
        
		//Put the label above the slider
		//with a 10-pixel margin between them.
		UIFont *font = [UIFont fontWithName: @"Courier" size: 16];
		
        
		f = CGRectMake(
                       b.origin.x,
                       b.origin.y,
                       itemSize.width,
                       itemSize.height
                       );
        
		xSpeedLabel = [[UILabel alloc] initWithFrame: f];
		xSpeedLabel.textAlignment = UITextAlignmentCenter;
		xSpeedLabel.font = font;
        xSpeedLabel.backgroundColor = color;
         
		[self xValueChanged: xSpeedSlider];
		[self addSubview: xSpeedLabel];
        
        f = CGRectMake(
                       b.origin.x,
                       b.origin.y + itemSize.height * 4,
                       itemSize.width,
                       itemSize.height
                              );
        
		ySpeedSlider = [[UISlider alloc] initWithFrame: f];
		ySpeedSlider.minimumValue = minimumValue;
		ySpeedSlider.maximumValue = maximumValue;
		ySpeedSlider.value = [View ySpeed] / .15;
		ySpeedSlider.continuous = YES;	//default is YES
        
		//As the slider goes from the minimum to the maximum value,
		//red goes from 0 to 1.  Conversely, blue goes from 1 to 0.
        
		red = (ySpeedSlider.value - ySpeedSlider.minimumValue)
        / (ySpeedSlider.maximumValue - ySpeedSlider.minimumValue);
        
		ySpeedSlider.backgroundColor = [UIColor colorWithRed:
                                        red green: 0.0 blue: 1.0 - red alpha: 1.0];
        
		[ySpeedSlider addTarget:self
                         action: @selector(yValueChanged:)
               forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: ySpeedSlider];
        
		//Put the label above the slider
		//with a 10-pixel margin between them.
		f = CGRectMake(
                       b.origin.x,
                       b.origin.y + itemSize.height * 3,
                       itemSize.width,
                       itemSize.height
                       );
        
		ySpeedLabel = [[UILabel alloc] initWithFrame: f];
		ySpeedLabel.textAlignment = UITextAlignmentCenter;
		ySpeedLabel.font = font;
        ySpeedLabel.backgroundColor = color;
		[self yValueChanged: ySpeedSlider];
		[self addSubview: ySpeedLabel];
        
        
        font = [UIFont fontWithName: @"Courier" size: 13];
        //Do not specify a size for the switch.
		//Let the switch assume its own natural size.
		rotateSwitch = [[UISwitch alloc] initWithFrame: CGRectZero];
		if (rotateSwitch == nil) {
			return nil;
		}
        
		//Call the valueChanged: method of the application delegate
		//when the value of the switch is changed.
		
		[rotateSwitch addTarget: self
                     action: @selector(rotateSwitchValueChanged:)
           forControlEvents: UIControlEventValueChanged
         ];
		
		rotateSwitch.center = CGPointMake(
                                      b.origin.x + b.size.width / 2 + 20 ,
                                      b.origin.y + 15 + 16
                                      );
        
		rotateSwitch.on = YES;	//the default
		[self addSubview: rotateSwitch];
        
        //Put the label above the slider
		//with a 10-pixel margin between them.
		f = CGRectMake(
                       b.origin.x + b.size.width /2 - 20,
                       b.origin.y,
                       itemSize.width / 2,
                       itemSize.height
                       );
        
		rotateLabel = [[UILabel alloc] initWithFrame: f];
		rotateLabel.textAlignment = UITextAlignmentCenter;
		rotateLabel.font = font;
        rotateLabel.backgroundColor = color;
        rotateLabel.text = @"Rotation";
		[self addSubview: rotateLabel];
        
        //Do not specify a size for the switch.
		//Let the switch assume its own natural size.
		bounceSwitch = [[UISwitch alloc] initWithFrame: CGRectZero];
		if (bounceSwitch == nil) {
			return nil;
		}
        
		//Call the valueChanged: method of the application delegate
		//when the value of the switch is changed.
		
		[bounceSwitch addTarget: self
                         action: @selector(bounceSwitchValueChanged:)
               forControlEvents: UIControlEventValueChanged
         ];
		
		bounceSwitch.center = CGPointMake(
                                          b.origin.x + b.size.width / 2 + 40 + itemSize.width / 2,
                                          b.origin.y + 15 + 16
                                          );
        
		bounceSwitch.on = YES;	//the default
		[self addSubview: bounceSwitch];
        
        //Put the label above the slider
		//with a 10-pixel margin between them.
		f = CGRectMake(
                       b.origin.x + b.size.width /2 + itemSize.width / 2,
                       b.origin.y,
                       itemSize.width / 2,
                       itemSize.height
                       );
        
		bounceLabel = [[UILabel alloc] initWithFrame: f];
		bounceLabel.textAlignment = UITextAlignmentCenter;
		bounceLabel.font = font;
        bounceLabel.backgroundColor = color;
        bounceLabel.text = @"Bouncing";
		[self addSubview: bounceLabel];
        
        
        
        //Red Slider
        font = [UIFont fontWithName: @"Courier" size: 12];
        f = CGRectMake(
                       b.origin.x + b.size.width / 2,
                       b.origin.y + itemSize.height * 4,
                       itemSize.width / 3,
                       itemSize.height
                       );
        
		rColorSlider = [[UISlider alloc] initWithFrame: f];
		rColorSlider.minimumValue = 0;
		rColorSlider.maximumValue = 1;
		rColorSlider.value = [View rColor];
		rColorSlider.continuous = YES;	//default is YES
        
		//As the slider goes from the minimum to the maximum value,
		//red goes from 0 to 1.  Conversely, blue goes from 1 to 0.
        
		rColorSlider.backgroundColor = [UIColor colorWithRed: rColorSlider.value green: 0.0 blue: 0.0 alpha: 1.0];
        
		[rColorSlider addTarget:self
                         action: @selector(rColorChanged:)
               forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: rColorSlider];
        
		//Put the label above the slider
		//with a 10-pixel margin between them.
		f = CGRectMake(
                       b.origin.x + b.size.width / 2,
                       b.origin.y + itemSize.height * 3,
                       itemSize.width / 3,
                       itemSize.height
                       );
        
		rColorLabel = [[UILabel alloc] initWithFrame: f];
		rColorLabel.textAlignment = UITextAlignmentCenter;
		rColorLabel.font = font;
        rColorLabel.backgroundColor = color;
		[self rColorChanged: rColorSlider];
		[self addSubview: rColorLabel];
        
        //Green Slider
        f = CGRectMake(
                       b.origin.x + b.size.width / 2 + itemSize.width / 3 + 5,
                       b.origin.y + itemSize.height * 4,
                       itemSize.width / 3,
                       itemSize.height
                       );
        
		gColorSlider = [[UISlider alloc] initWithFrame: f];
		gColorSlider.minimumValue = 0;
		gColorSlider.maximumValue = 1;
		gColorSlider.value = [View gColor];
		gColorSlider.continuous = YES;	//default is YES
        
		//As the slider goes from the minimum to the maximum value,
		//red goes from 0 to 1.  Conversely, blue goes from 1 to 0.
        
		gColorSlider.backgroundColor = [UIColor colorWithRed: 0.0 green: gColorSlider.value blue: 0.0 alpha: 1.0];
        
		[gColorSlider addTarget:self
                         action: @selector(gColorChanged:)
               forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: gColorSlider];
        
		//Put the label above the slider
		//with a 10-pixel margin between them.
		f = CGRectMake(
                       b.origin.x + b.size.width / 2 + itemSize.width / 3 + 5,
                       b.origin.y + itemSize.height * 3,
                       itemSize.width / 3,
                       itemSize.height
                       );
        
		gColorLabel = [[UILabel alloc] initWithFrame: f];
		gColorLabel.textAlignment = UITextAlignmentCenter;
		gColorLabel.font = font;
        gColorLabel.backgroundColor = color;
		[self gColorChanged: gColorSlider];
		[self addSubview: gColorLabel];
        
        //Blue Slider
        f = CGRectMake(
                       b.origin.x + b.size.width / 2 + 2*(itemSize.width / 3 + 5),
                       b.origin.y + itemSize.height * 4,
                       itemSize.width / 3,
                       itemSize.height
                       );
        
		bColorSlider = [[UISlider alloc] initWithFrame: f];
		bColorSlider.minimumValue = 0;
		bColorSlider.maximumValue = 1;
		bColorSlider.value = [View bColor];
		bColorSlider.continuous = YES;	//default is YES
        
		//As the slider goes from the minimum to the maximum value,
		//red goes from 0 to 1.  Conversely, blue goes from 1 to 0.
        
		bColorSlider.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.0 blue: bColorSlider.value alpha: 1.0];
        
		[bColorSlider addTarget:self
                         action: @selector(bColorChanged:)
               forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: bColorSlider];
        
		//Put the label above the slider
		//with a 10-pixel margin between them.
		f = CGRectMake(
                       b.origin.x + b.size.width / 2 + 2*(itemSize.width / 3 + 5),
                       b.origin.y + itemSize.height * 3,
                       itemSize.width / 3,
                       itemSize.height
                       );
        
		bColorLabel = [[UILabel alloc] initWithFrame: f];
		bColorLabel.textAlignment = UITextAlignmentCenter;
		bColorLabel.font = font;
        bColorLabel.backgroundColor = color;
		[self bColorChanged: bColorSlider];
		[self addSubview: bColorLabel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
