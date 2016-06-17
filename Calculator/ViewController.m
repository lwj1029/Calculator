//
//  ViewController.m
//  Calculator
//
//  Created by MF839-015 on 2016. 6. 15..
//  Copyright © 2016년 woojin lee. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"

@interface ViewController ()
@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}


@synthesize display;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentNumber = 0;
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];

    self.myButton.enabled = YES;
    
    [displayString setString:@""];
    display.text = displayString;

}
- (void)processDigit:(int)digit
{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}
- (void)processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
            
        default:
            break;
    }
    [self storeFracePart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}
- (void)storeFracePart
{
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }else if(isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}

- (IBAction)clickOver:(id)sender {
    [self storeFracePart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openInfoView:(id)sender {

    InfoViewController *infoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoView"];//identity storyboard id "InfoView"
    
    infoViewController.deligate = self;
    
//    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
//    infoViewController.myString = @"vvvvvvvvvvvv";//self.display.text;
    
    
//    [self presentViewController:infoViewController animated:YES completion:nil];
    
    [self performSegueWithIdentifier:@"GreenView" sender:self];

}

- (IBAction)openNewView:(id)sender {
    [self performSegueWithIdentifier:@"PuppleView" sender:self];
}

- (IBAction)unwideToViewController:(UIStoryboardSegue*)sender
{
    NSLog(@"close pupple wiew");
}

- (IBAction)clickDigit:(UIButton*)sender {
    //UIButton *btn = (UIButton*) sender;
    //int digit = (int)btn.tag;
    int digit = (int)sender.tag;
    [self processDigit: digit];

}

- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];
    [self setButtonEnabled:NO];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];
    [self setButtonEnabled:NO];
}

- (IBAction)clickMuliply:(id)sender {
    [self processOp:'*'];
    [self setButtonEnabled:NO];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'/'];
    [self setButtonEnabled:NO];
}


- (IBAction)clickEquals:(id)sender {
    if(firstOperand == NO){
        [self storeFracePart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@"="];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
        
        self.myButton.enabled = NO;
        [self setButtonEnabled:YES];
    }
}

- (IBAction)clickClear:(id)sender {
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
    [self setButtonEnabled:YES];
    self.myButton.enabled = YES;
}

- (void)setButtonEnabled:(BOOL)val
{
    for(int i=0; i<self.myButtonOper.count;i++){
        UIButton *btn = [self.myButtonOper objectAtIndex:i];
        btn.enabled = val;
    }
}

- (void)changeColor:(UIColor*)newColor
{
    NSLog(@"ChangeColor!");
    [self.view setBackgroundColor:newColor];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Segu ID = %@", segue.identifier);
    
    if([segue.identifier isEqualToString:@"GreenView"])
    {
        InfoViewController *infoView = [segue destinationViewController];
        infoView.myString = @"Hellow World Green";
    }
    
}
@end
