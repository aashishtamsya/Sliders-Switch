//
//  ViewController.m
//  Sliders & Switch
//
//  Created by Felix ITs 01 on 27/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import "ViewController.h"

NSString *musicSwitchKey  = @"switchState";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateMusicLabel:[self loadMusicSwitchStateFromUserDefaultsForKey:musicSwitchKey]];
    
    
    
    
    
}
#pragma mark Switch Update Methods


-(void)updateMusicLabel {
    
    
    if (self.musicSwitch.on) {
        self.musicLabel.text = @"Music is On.";
        
    }
    else {
        self.musicLabel.text = @"Music is Off.";

    }
}

-(void)updateMusicLabel:(NSString *)stateString {

    
    if ([stateString isEqualToString:@"On"]) {
        self.musicLabel.text = @"Music is On.";
        [self.musicSwitch setOn:YES];

    }
    else {
        self.musicLabel.text = @"Music is Off.";
        [self.musicSwitch setOn:NO];

    }
}



#pragma mark NSUserDefaults Methods

-(void)updateMusicSwitchStateInUserDefaults:(NSString *)value key:(NSString *)key {
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(NSString *)loadMusicSwitchStateFromUserDefaultsForKey:(NSString *)key {
    
    
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIButton Action Methods


- (IBAction)musicSwitchValueChanged:(id)sender {
    
    
    [self updateMusicLabel];
    
    UISwitch *mySwitch = sender;
    
    NSString *switchState = @"";
    
    if (mySwitch.isOn) {
        switchState = @"On";
    }
    else {
        switchState = @"Off";

    }
    

    [self updateMusicSwitchStateInUserDefaults:switchState key:musicSwitchKey];
   
    
}



- (IBAction)redSliderValueChanged:(id)sender {
}

- (IBAction)greenSliderValueChanged:(id)sender {
}

- (IBAction)blueSliderValueChanged:(id)sender {
}

- (IBAction)alphaSliderValueChanged:(id)sender {
}
@end
