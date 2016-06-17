//
//  Fraction.m
//  ObjC
//
//  Created by MF839-015 on 2016. 6. 13..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator = _numerator, denominator = _denominator;

- (void) print
{
//    if(_numerator>0 && _denominator<0)
//       NSLog(@"-%i/%i",_numerator, abs(_denominator));
//    else
//    if(_numerator<0 && _denominator<0)
//        NSLog(@"%i/%i",abs(_numerator), abs(_denominator));
//    else
        NSLog(@"%i/%i",_numerator, _denominator);

}

- (NSString *) convertToString
{
    if(_numerator == _denominator)
        if(_numerator==0)
            return @"0";
        else
            return @"1";
        else if(_denominator==1)
            return [NSString stringWithFormat:@"%i",_numerator];
        else
            return [NSString stringWithFormat:@"%i/%i",_numerator,_denominator];
}
- (double) convertToNum
{
    if(_denominator != 0)
        return (double) _numerator/_denominator;
    else
        return NAN;
}

- (void) setTo: (int) n over: (int) d
{
    _numerator = n;
    _denominator = d;
}

- (void) reduce
{
    int u = _numerator, v = _denominator, tmp;
    
    while(v != 0){
        tmp = u % v;
        u = v;
        v = tmp;
    }
    
    _numerator /= u;
    _denominator /= u;
}


- (Fraction *) add:(Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    // a/b + c/d = ((a*d) + (b*c)) / (b*d)
    result.numerator = self.numerator * f.denominator + self.denominator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    
    [result reduce];
    
    return result;
}
- (Fraction *) sub:(Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    // a/b - c/d = ((a*d) - (b*c)) / (b*d)
    result.numerator = self.numerator * f.denominator - self.denominator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    
    [result reduce];
    
    return result;
    
}
- (Fraction *) mul:(Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    // a/b x c/d = a x c / b x d
    result.numerator = self.numerator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    
    [result reduce];
    
    return result;
    
}
- (Fraction *) div:(Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    // a/b / c/d = a x d / b x c
    result.numerator = self.numerator * f.denominator;
    result.denominator = self.denominator * f.numerator;
    
    [result reduce];
    
    return result;
    
}



@end
