//
//  AboutViewController.h
//  BullsEye
//
//  Created by Rene Kurfürst on 19.12.12.
//  Copyright (c) 2012 Rene Kurfürst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)close;

@end
