//
//  HKDesignableView.m
//  DemoViewRender
//
//  Created by Hai Kieu on 10/21/15.
//  Copyright © 2015 Hai Kieu. All rights reserved.
//

#import "HKDesignableView.h"

@implementation HKDesignableView

#pragma mark - Device / Simulator / Interface Builder targets

-(BOOL)isInterfaceBuilderTarget
{
#if TARGET_INTERFACE_BUILDER
    return YES;
#endif
    return NO;
}

-(BOOL)isDeviceTarget
{
#if TARGET_IPHONE_SIMULATOR
    return YES;
#endif
    return NO;
}

-(BOOL)isSimulatorTarget
{
#if TARGET_OS_IOS
    return YES;
#endif
    return NO;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder //Called by device / simulator only
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [[self loadContentView] loadContentConstraint];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame  //Called by device / simulator / interface builder
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [[self loadContentView] loadContentConstraint];
    }
    return self;
}

#pragma mark - Build content view

-(instancetype)loadContentView
{
    _contentView = [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;

    [self addSubview:_contentView];
    
    return self;
}

-(instancetype)loadContentConstraint
{
    //Prevent generate sub-constraint system within contentView
    [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint * top = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint * left = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSLayoutConstraint * bottom = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint * right = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    [self addConstraints:@[top,left,bottom,right]];
    
    return self;
}



-(void)awakeFromNib //Called on device/simulator
{
    [super awakeFromNib];
    [self prepareForInterfaceBuilder];
}

#pragma mark - Rendered on Interface Builder

-(void)prepareForInterfaceBuilder   //Called in interface builder only
{
    [super prepareForInterfaceBuilder];
    [self prepareInterface];
}

-(instancetype)prepareInterface
{
    return [self prepareView];
}

-(instancetype)prepareView
{
    self.contentView.backgroundColor = self.backgroundColor;
    return self;
}

@end
