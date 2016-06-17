//
//  ViewController.h
//  Calculator
//
//  Created by MF839-015 on 2016. 6. 15..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

@interface ViewController : UIViewController<InfoViewProtocol>

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (weak, nonatomic) IBOutlet UIButton *myButton;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtonOper;

- (IBAction)openInfoView:(id)sender;
- (IBAction)openNewView:(id)sender;

- (IBAction)unwideToViewController:(UIStoryboardSegue*)sender;//pupple close

- (IBAction)clickDigit:(id)sender;

- (void)processDigit:(int)digit;
- (void)processOp:(char)theOp;
- (void)storeFracePart;

- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMuliply:(id)sender;
- (IBAction)clickDivide:(id)sender;

- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

- (void)setButtonEnabled:(BOOL)val;

- (void)changeColor:(UIColor*)newColor;
@end

