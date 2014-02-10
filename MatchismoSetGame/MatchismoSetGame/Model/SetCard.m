//
//  SetCard.m
//  MatchismoSetGame
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard



+(NSArray *)validColors{

    return @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor]];

}
+(NSArray *)validNumber{

    return @[@1,@2,@3];

}
+(NSArray *)validShading{

    return @[@"fill",@"blank",@"alpha"];

}

+(NSArray *)validShape{

return @[@"triangle",@"square",@"circle"];
}

@end
