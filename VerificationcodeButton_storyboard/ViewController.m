//
//  ViewController.m
//  VerificationcodeButton_storyboard
//
//  Created by kimi.zhang on 16/4/13.
//  Copyright © 2016年 kimi.zhang. All rights reserved.
//

#import "ViewController.h"
#import "UICountingButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICountingButton *verificationcodeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)verificationcodeAction:(id)sender {
//    self.verificationcodeButton.userInteractionEnabled = NO;
    [self.verificationcodeButton countFrom:60 to:0 withDuration:60];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
