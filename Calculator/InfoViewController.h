//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-015 on 2016. 6. 16..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>
- (void) changeColor: (UIColor*)newColor;
@end

@interface InfoViewController : UIViewController

@property(nonatomic, weak) NSString *myString;

@property (weak, nonatomic) IBOutlet UILabel *myLable;

@property (nonatomic, strong) id<InfoViewProtocol> deligate;

- (IBAction)close:(id)sender;
- (IBAction)changeColor:(id)sender;

@end
