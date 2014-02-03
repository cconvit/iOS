//
//  PlayingCard.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "PlayingCard.h"


@implementation PlayingCard

@synthesize suit=_suit;

-(NSString *)contents{

    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}
+(NSUInteger)maxRank{
    return [[PlayingCard rankStrings] count]-1;
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(NSString *)suit{

    return _suit ? _suit:@"?";
}

-(void)setSuit:(NSString *)suit{

    if([[PlayingCard validSuits] containsObject:suit] ){
        _suit=suit;
    }

}
@end