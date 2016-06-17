//
//  InfoViewController.m
//  Calculator
//
//  Created by MF839-015 on 2016. 6. 16..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myLable.text = self.myString;
    NSLog(@"Text = %@", self.myString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeColor:(id)sender {
    if([self.deligate respondsToSelector:@selector(changeColor:)]){
        [self.deligate changeColor:[UIColor redColor]];
    }
}

- (IBAction)close:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
