//
//  BullysEyeViewController.h
//  BullsEye
//
//  Created by Rene Kurfürst on 09.11.12.
//  Copyright (c) 2012 Rene Kurfürst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullysEyeViewController : UIViewController <UIAlertViewDelegate>

- (IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider *)sender;

- (IBAction)startOver;

- (IBAction)showInfo;

@property (nonatomic, strong) IBOutlet UISlider *slider;

@property (nonatomic, strong) IBOutlet UILabel *targetLabel;

@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;

@property (nonatomic, strong) IBOutlet UILabel *roundLabel;

@end
