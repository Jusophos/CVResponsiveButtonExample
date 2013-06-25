//
//  ViewController.m
//  CVResponsiveButtonExample
//
//  Created by Richard Jung on 25.06.13.
//  Copyright (c) 2013 CoreVision. All rights reserved.
//

#import "ViewController.h"

#import "CVResponsiveButton.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    for (CVResponsiveButton *button in self.view.subviews) {
        
        if ([button isKindOfClass:[CVResponsiveButton class]]) {
            
            button.highlightBackgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[ud objectForKey:@"highlight_color"]];
            button.fadingTime = [ud floatForKey:@"fading_time"];
        }
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

    
}


#pragma mark - Actions
- (IBAction)openOptions:(id)sender {
    
    
}

- (IBAction)clearOutput:(id)sender {
    
    self.outputField.text = @"";
}

- (IBAction)someAction:(id)sender {
    
    self.outputField.text = [self.outputField.text stringByAppendingString:[[(UIButton *)sender titleLabel] text]];
}

@end
