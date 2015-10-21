//
//  HKDesignableDragableView.m
//  DemoViewRender
//
//  Created by Hai Kieu on 10/21/15.
//  Copyright © 2015 Hai Kieu. All rights reserved.
//

#import "HKDesignableDragableView.h"
#import <UIKit/UIKit.h>

@interface HKDesignableView(HKDesignableDragableView)

-(instancetype)prepareInterface;

@end


@interface HKDesignableDragableView ()

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;

@property (assign,nonatomic)CGPoint originLocation;
@property (assign,nonatomic)CGPoint previousLocation;

@end

@implementation HKDesignableDragableView

-(void)awakeFromNib
{
    [self prepareGesture:self.dragable];
}

-(instancetype)prepareGesture:(BOOL) enable
{

    @synchronized(self)
    {
        if(!self.panGesture)
        {
            self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
            [self addGestureRecognizer:_panGesture];
        }
    }
    
    self.panGesture.enabled = enable;
    
    return self;
}

-(instancetype)moveView:(UIView*)view FromPoint:(CGPoint)originPoint toPoint:(CGPoint)newPoint
{
    CGFloat x = originPoint.x + newPoint.x;
    CGFloat y = originPoint.y + newPoint.y;
    view.center = CGPointMake(x, y);
    
    return self;
}

-(instancetype)moveViewFromPoint:(CGPoint)originPoint toPoint:(CGPoint)newPoint
{
    [self moveView:self FromPoint:originPoint toPoint:newPoint];
    
    return self;
}

-(instancetype)saveLocation
{
    self.previousLocation = self.originLocation;
    self.originLocation = CGPointZero;
    
    return self;
}

-(instancetype)revertLocation
{
    
    return self;
}

- (IBAction)handlePanGesture:(id)sender {
    
    if([sender isKindOfClass:[UIPanGestureRecognizer class]])
    {
        UIPanGestureRecognizer * panGesture = sender;
        if(panGesture.state == UIGestureRecognizerStateBegan)
        {
            NSLog(@"State >>> %@",@"UIGestureRecognizerStateBegan");
            CGPoint movePoint = [panGesture translationInView:self.containerView];
            NSLog(@"Begin(%f,%f) center(%f,%f)",movePoint.x,movePoint.y,self.center.x,self.center.y);
            self.originLocation = self.center;

            [self moveViewFromPoint:self.originLocation toPoint:movePoint];
        }
        else if(panGesture.state == UIGestureRecognizerStateChanged)
        {
            NSLog(@"State >>> %@",@"UIGestureRecognizerStateChanged");
            CGPoint movePoint = [panGesture translationInView:self.containerView];
            NSLog(@"Move(%f,%f) center(%f,%f)",movePoint.x,movePoint.y,self.center.x,self.center.y);

            [self moveViewFromPoint:self.originLocation toPoint:movePoint];
        }
        else if(panGesture.state == UIGestureRecognizerStateEnded)
        {
            NSLog(@"State >>> %@",@"UIGestureRecognizerStateEnded");
            CGPoint movePoint = [panGesture translationInView:self.containerView];
            NSLog(@"End(%f,%f) center(%f,%f)",movePoint.x,movePoint.y,self.center.x,self.center.y);
            
            [self moveViewFromPoint:self.originLocation toPoint:movePoint];
            
            //Save location
            [self saveLocation];
        }
        else if(panGesture.state == UIGestureRecognizerStateCancelled)
        {
            NSLog(@"State >>> %@",@"UIGestureRecognizerStateCancelled");
            
            //Revert back;
            [self revertLocation];
        }
        else if(panGesture.state == UIGestureRecognizerStateFailed)
        {
            //Revert back;
            [self revertLocation];
        }
    }
    
}

@end
