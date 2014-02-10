//
//  SetCardView.m
//  MatchismoSetGame
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#define CORNER_FONT_STANDAR_HEIGHT 180.0
#define WIDTH_SCALE 1
#define CORNER_RADIUS 12.0
#define STANDAR_WIDTH 18.0

#define ITEM_SPACE 3

-(CGFloat)cornerScaleFactor{ return self.bounds.size.height/CORNER_FONT_STANDAR_HEIGHT;}
-(CGFloat)cornerRadius{return CORNER_RADIUS*[self cornerScaleFactor];}
-(CGFloat)cornerOffset{return [self cornerRadius]/3.0;}
-(CGFloat)centerRight {return (self.bounds.size.width/2)+STANDAR_WIDTH;}
-(CGFloat)centerLeft {return (self.bounds.size.width/2)-STANDAR_WIDTH;}
-(CGFloat)widthScaleFactor{ return (self.bounds.size.width/2)*WIDTH_SCALE;}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

-(void)drawRect:(CGRect)rect{
    
    //drawing code
    UIBezierPath *roundedRect=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius] ] ;
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    [self drawSquare];

    
}*/


-(float)itemHeight{
    
    unsigned int x=3;
     float h=(self.bounds.size.height -ITEM_SPACE*x+1)/x;
    
    return h-2;

}

-(float)start_point_height:(int)count{
    
    switch(count)
    {
        case 1: return self.bounds.size.height/2-self.bounds.size.height/4;
        case 2:return self.bounds.size.height/4-self.bounds.size.height/8;
        case 3:return ITEM_SPACE;
        default: return 0;
            
    }
    
}


-(void)drawTriangles:(NSNumber *)number color:(UIColor *)color fill:(NSString *)fill{

    
    for(int x=1;x<4;x++){
    
        UIBezierPath *path=[[UIBezierPath alloc] init];
        // self.view.backgroundColor = [UIColor clearColor];
        [path moveToPoint:CGPointMake(self.bounds.size.width/2,(x-1)* [self itemHeight]+ x*ITEM_SPACE)];
        [path addLineToPoint:CGPointMake([self centerRight],x*[self itemHeight]+x*ITEM_SPACE)];
        [path addLineToPoint:CGPointMake([self centerLeft], x*[self itemHeight]+x*ITEM_SPACE)];
        [path closePath];
        
       // [[UIColor greenColor] setFill];
        [color setStroke];
        [path fill];
        [path stroke];
    
    }
    
    

}

-(void)drawSquare{
    int number=3;
    
    
    for(int x=1;x<number+1;x++){
        
        CGRect box = CGRectInset(self.bounds, self.bounds.size.width * 0.1f, self.bounds.size.height * 0.2f);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:box];
        // scale it
        CGFloat scale = 0.35;
        [path applyTransform:CGAffineTransformMakeScale(scale, scale)];
        
        // move it
        [path applyTransform:CGAffineTransformMakeTranslation((self.bounds.size.width/2)-[self itemHeight]/2,(x-1)* [self itemHeight]+ x*[self start_point_height:number])];
        
      //  [[UIColor greenColor] setFill];
        [[UIColor redColor] setStroke];
        [path fill];
        [path stroke];
        
    }
    
    
    
}

-(void)drawCircle{
    int number=1;

    
    for(int x=1;x<number+1;x++){
        
        CGRect box = CGRectInset(self.bounds, self.bounds.size.width * 0.1f, self.bounds.size.height * 0.2f);
        
       UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:box];
        // scale it
        CGFloat scale = 0.35;
        [path applyTransform:CGAffineTransformMakeScale(scale, scale)];
        
        // move it
        [path applyTransform:CGAffineTransformMakeTranslation((self.bounds.size.width/2)-[self itemHeight]/2,(x-1)* [self itemHeight]+ x*[self start_point_height:number])];
        
        [[UIColor greenColor] setFill];
        [[UIColor redColor] setStroke];
        [path fill];
        [path stroke];
        
    }
    
    
    
}




@end
