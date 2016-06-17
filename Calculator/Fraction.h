//
//  Fraction.h
//  ObjC
//
//  Created by MF839-015 on 2016. 6. 13..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
- (double) convertToNum;
- (void) setTo: (int) n over: (int) d;
- (void) reduce;
- (NSString *) convertToString;

- (Fraction *) add:(Fraction *) f;
- (Fraction *) sub:(Fraction *) f;
- (Fraction *) mul:(Fraction *) f;
- (Fraction *) div:(Fraction *) f;
@end
