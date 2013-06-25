//
//  OptionsViewController.m
//  CVResponsiveButtonExample
//
//  Created by Richard Jung on 25.06.13.
//  Copyright (c) 2013 CoreVision. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

#pragma mark - Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
    }
    return self;
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    
    [super viewDidLoad];

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    NSArray *subviews = self.view.subviews;
    
    for (UIButton *subview in subviews) {
        
        if (subview.tag > 0) {
            
            if (subview.tag == [ud integerForKey:@"highlight_color_index"]) {
                
                [subview setTitle:@"✔" forState:UIControlStateNormal];
                currentHighlightButton = subview;
                
            } else {
                
                [subview setTitle:@"" forState:UIControlStateNormal];
            }
        }
    }
    
    self.fadingTimeSlider.value = [ud floatForKey:@"fading_time"];
    self.fadingTimeLabel.text = [NSString stringWithFormat:@"%.01f s", [ud floatForKey:@"fading_time"]];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

    
}

#pragma mark - Actions
- (IBAction)applyColor:(id)sender {
    
    [currentHighlightButton setTitle:@"" forState:UIControlStateNormal];
    [(UIButton *)sender setTitle:@"✔" forState:UIControlStateNormal];
    
    currentHighlightButton = sender;
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:[(UIButton *)sender backgroundColor]];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:colorData forKey:@"highlight_color"];
    [ud setInteger:[(UIButton *)sender tag] forKey:@"highlight_color_index"];
    [ud synchronize];
}

- (IBAction)done:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)fadingTimeChange:(id)sender {
    
    self.fadingTimeLabel.text = [NSString stringWithFormat:@"%.01f s", [(UISlider *)sender value]];
}

- (IBAction)fadingTimeEnded:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setFloat:self.fadingTimeSlider.value forKey:@"fading_time"];
    [ud synchronize];
}

- (IBAction)openGithub:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Jusophos/CVResponsiveButton/"]];
}

@end
