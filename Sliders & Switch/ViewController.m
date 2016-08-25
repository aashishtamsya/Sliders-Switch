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
    
    [self changeColor:nil component:All];
    self.viewColor.layer.cornerRadius = self.viewColor.bounds.size.width/8;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeColorwWithRed:(float)red
                     green:(float)green
                      blue:(float)blue {
    
    self.viewColor.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
}

-(void)changeColor:(UISlider *) slider component:(ColorComponent) color {
    
    switch (color) {
        case Red: [self changeColorwWithRed:slider.value green:self.sliderGreen.value blue:self.sliderBlue.value];
            self.labelRed.text = [NSString stringWithFormat:@"%0.3f",slider.value];
            break;
        case Green: [self changeColorwWithRed:self.sliderRed.value green:slider.value blue:self.sliderBlue.value];
            self.labelGreen.text = [NSString stringWithFormat:@"%0.3f",slider.value];
            break;
        case Blue: [self changeColorwWithRed:self.sliderRed.value green:self.sliderGreen.value blue:slider.value];
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
@end
