//
//  OptionsViewController.h
//  CVResponsiveButtonExample
//
//  Created by Richard Jung on 25.06.13.
//  Copyright (c) 2013 CoreVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsViewController : UIViewController {
    
    UIButton __weak *currentHighlightButton;
}

@property (strong, nonatomic) IBOutlet UISlider *fadingTimeSlider;
@property (strong, nonatomic) IBOutlet UILabel *fadingTimeLabel;

#pragma mark - Actions
- (IBAction)applyColor:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)fadingTimeChange:(id)sender;
- (IBAction)fadingTimeEnded:(id)sender;
- (IBAction)openGithub:(id)sender;

@end
