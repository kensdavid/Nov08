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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
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
        
		[self yValueChanged: ySpeedSlider];
		[self addSubview: ySpeedLabel];
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
