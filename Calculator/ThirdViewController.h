//
//  ThirdViewController.h
//  Calculator
//
//  Created by MF839-015 on 2016. 6. 17..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    void(^changeMainBackColor)(UIColor*);
}
@property void(^newChangeMainBackColor)(UIColor*);

@property(nonatomic, weak) NSString *thirdString;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;

- (IBAction)changeColor:(id)sender;
- (void)changeColorFunc:(void(^)(UIColor*))myFunc;

@end
