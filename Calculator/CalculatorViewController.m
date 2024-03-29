//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Erik Kasper on 06.04.13.
//  Copyright (c) 2013 Erik Kasper. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfTypingANumber;
@property (nonatomic,strong) CalculatorBrain *brain;
@end
@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfTypingANumber = _userIsInTheMiddleOfTypingANumber;
@synthesize brain = _brain;

-(CalculatorBrain *)brain{
    if(!_brain) _brain= [[CalculatorBrain alloc]init];
    return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    NSLog(@"test: %@", digit);
    if(self.userIsInTheMiddleOfTypingANumber){
    self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfTypingANumber = YES;
    }
}
- (IBAction)enterPressed{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfTypingANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if(self.userIsInTheMiddleOfTypingANumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];  
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
    
    
    
}


@end


