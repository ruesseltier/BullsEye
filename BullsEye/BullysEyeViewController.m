//
//  BullysEyeViewController.m
//  BullsEye
//
//  Created by Rene Kurfürst on 09.11.12.
//  Copyright (c) 2012 Rene Kurfürst. All rights reserved.
//

#import "BullysEyeViewController.h"

#import "AboutViewController.h"

@interface BullysEyeViewController ()

@end

@implementation BullysEyeViewController {
    int currentValue;
    int targetValue;
    int score;
    int round;
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound {
    
    round += 1;
    
    targetValue = 1 + (arc4random() % 100);
    
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)startNewGame {
    score = 0;
    round = 0;
    [self startNewRound];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startNewGame];
    [self updateLabels];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
    interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    score += points;
    
    NSString *title;
    if (difference == 0){
        title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        if (difference == 1) {
            points += 50;
        }
        title = @"You almost did it!";
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    
    NSString *message =[NSString stringWithFormat:@"You scored %d points", points];
    
    
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:title
        message:message
        delegate:self
        cancelButtonTitle:@"Ok"
        otherButtonTitles:nil];
    
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider*)sender
{
    currentValue = lroundf(sender.value);
}

- (IBAction)startOver {
    [self startNewGame];
    [self updateLabels];
}

- (IBAction)showInfo {
    AboutViewController *controller = [[AboutViewController alloc]
                                       initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

@end
