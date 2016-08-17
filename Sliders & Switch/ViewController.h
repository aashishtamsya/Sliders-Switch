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
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
}

@property (weak, nonatomic) IBOutlet UISwitch *musicSwitch;

- (IBAction)musicSwitchValueChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *musicLabel;





@end
