//
//  ControlView.h
//  Nov08
//
//  Created by Ken David on 11/18/12.
//
//

#import <UIKit/UIKit.h>

@interface ControlView : UIView {

    UISlider *xSpeedSlider;
    UILabel *xSpeedLabel;
    UISlider *ySpeedSlider;
    UILabel *ySpeedLabel;
    
    UISwitch *rotateSwitch;
    UILabel *rotateLabel;
    UISwitch *bounceSwitch;
    UILabel *bounceLabel;
    
    UISlider *rColorSlider;
    UILabel *rColorLabel;
    UISlider *gColorSlider;
    UILabel *gColorLabel;
    UISlider *bColorSlider;
    UILabel *bColorLabel;
}

@end
