//
//  ViewController.m
//  Sliders & Switch
//
//  Created by Felix ITs 01 on 27/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSUInteger {
    Red = 0,
    Green = 1,
    Blue = 2,
    All = 3,
} ColorComponent;



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self setupScreen];
  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupScreen {
    
    self.switchReset.on = NO;
    [self changeColor:nil component:All];
    self.viewColor.layer.cornerRadius = self.viewColor.bounds.size.width/16;
    [self updateText];
}

-(void)updateText {
    self.labelRed.text = [NSString stringWithFormat:@"%0.3f",self.sliderRed.value];
    self.labelGreen.text = [NSString stringWithFormat:@"%0.3f",self.sliderGreen.value];
    self.labelBlue.text = [NSString stringWithFormat:@"%0.3f",self.sliderBlue.value];
}

-(void)resetAll {
    
    previousRed = self.sliderRed.value;
    self.sliderRed.value= 0;

    previousBlue = self.sliderBlue.value;
    self.sliderBlue.value= 0;

    previousGreen = self.sliderGreen.value;
    self.sliderGreen.value= 0;
    
    [self updateText];

    [self changeColor:nil component:All];
}

-(void)undoResetAll {
    self.sliderRed.value = previousRed;
    self.sliderGreen.value = previousGreen;
    self.sliderBlue.value = previousBlue;
    [self updateText];
    [self changeColor:nil component:All];
}

-(void)changeColorwWithRed:(float)red
                     green:(float)green
                      blue:(float)blue {
    
    self.viewColor.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
}

-(void)changeColor:(UISlider *) slider component:(ColorComponent) color {
    
    switch (color) {
        case Red:
            previousRed = slider.value;
            [self changeColorwWithRed:slider.value green:self.sliderGreen.value blue:self.sliderBlue.value];
            self.labelRed.text = [NSString stringWithFormat:@"%0.3f",slider.value];
            break;
        case Green:
            previousGreen = slider.value;
            [self changeColorwWithRed:self.sliderRed.value green:slider.value blue:self.sliderBlue.value];
            self.labelGreen.text = [NSString stringWithFormat:@"%0.3f",slider.value];
            break;
        case Blue:
            previousBlue = slider.value;
            [self changeColorwWithRed:self.sliderRed.value green:self.sliderGreen.value blue:slider.value];
            self.labelBlue.text = [NSString stringWithFormat:@"%0.3f",slider.value];
            break;
        case All: [self changeColorwWithRed:self.sliderRed.value green:self.sliderGreen.value blue:self.sliderBlue.value];
            break;
    }
}


- (IBAction)redSliderAction:(id)sender {
    UISlider *slider = sender;
    [self changeColor:slider component:Red];
}

- (IBAction)greenSliderAction:(id)sender {
    UISlider *slider = sender;
    [self changeColor:slider component:Green];
}

- (IBAction)blueSliderAction:(id)sender {
    UISlider *slider = sender;
    [self changeColor:slider component:Blue];
}
- (IBAction)resetSwitchAction:(id)sender {
    
    UISwitch *resetSwitch = sender;
    
    if (resetSwitch.on) {
        [self resetAll];
    }
    else {
        [self undoResetAll];
    }
    
}
@end
