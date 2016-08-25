//
//  ViewController.h
//  Sliders & Switch
//
//  Created by Felix ITs 01 on 27/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    float previousRed;
    float previousGreen;
    float previousBlue;

}

@property (weak, nonatomic) IBOutlet UISwitch *switchReset;

- (IBAction)resetSwitchAction:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *sliderRed;

@property (weak, nonatomic) IBOutlet UISlider *sliderGreen;

@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;

- (IBAction)redSliderAction:(id)sender;
- (IBAction)greenSliderAction:(id)sender;
- (IBAction)blueSliderAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelGreen;
@property (weak, nonatomic) IBOutlet UILabel *labelRed;

@property (weak, nonatomic) IBOutlet UILabel *labelBlue;


@property (weak, nonatomic) IBOutlet UIView *viewColor;

@end

