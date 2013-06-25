//
//  ViewController.h
//  CVResponsiveButtonExample
//
//  Created by Richard Jung on 25.06.13.
//  Copyright (c) 2013 CoreVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *outputField;

#pragma mark - Actions
- (IBAction)openOptions:(id)sender;
- (IBAction)clearOutput:(id)sender;
- (IBAction)someAction:(id)sender;

@end
