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

-(int) match:(NSArray *)otherCards{
    int score=0;
    
    if([otherCards count]>0){
       /*
        for(PlayingCard *otherCard in otherCards){
        
            if(otherCard.rank == self.rank){
                score=4;
            }else if ([otherCard.suit isEqualToString:self.suit]){
                score=1;
            }
        
        }
       */
        for(int x=0;x<[otherCards count];x++){
        
            PlayingCard *otherCard_x=otherCards[x];
            
            for(int y=x+1;y<[otherCards count];y++){
                
                PlayingCard *otherCard_y=otherCards[y];
                if(otherCard_y.rank == otherCard_x.rank){
                    score+=4;
                    
                    
                }else if ([otherCard_y.suit isEqualToString:otherCard_x.suit]){
                    score+=1;
                }
                
            }
        }

        
        
    }
    return score;
}


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
