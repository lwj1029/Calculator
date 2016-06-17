//
//  Calculator.h
//  ObjC
//
//  Created by MF839-015 on 2016. 6. 14..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject
@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

- (Fraction*) performOperation:(char)op;
- (void) clear;

@end
