//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Erik Kasper on 06.04.13.
//  Copyright (c) 2013 Erik Kasper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString*)operation;
@end
