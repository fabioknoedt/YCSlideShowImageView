//
//  YCSlideShowView.m
//  YU - YUPPIU
//
//  Created by Fabio Knoedt on 11/08/14.
//  Copyright (c) 2014 Datedicted. All rights reserved.
//

#import "YCSlideShowImageView.h"

@interface YCSlideShowImageView ()

@property (atomic, retain) NSMutableArray *images;

@end

@implementation YCSlideShowImageView

/*!
 *  @brief  Init method for object.
 *  @return The initialized object.
 */
- (id)init;
{
    if ((self = [super init]))
    {
        /// Initializes the default values.
        [self initDefaultValues];
    }
    return self;
}

/*!
 *  @brief  Init method for object.
 *  @return The initialized object.
 */
- (id)initWithCoder:(NSCoder *)aDecoder;
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        /// Initializes the default values.
        [self initDefaultValues];
    }
    return self;
}

/*!
 *  @brief  Init method for object.
 *  @return The initialized object.
 */
- (id)initWithFrame:(CGRect)frame;
{
    if ((self = [super initWithFrame:frame]))
    {
        /// Initializes the default values.
        [self initDefaultValues];
    }
    return self;
}

/*!
 *  @brief  Initializes the default values.
 */
- (void)initDefaultValues;
{
    /// Public property for animation duration.
    _animationDurationTime = 1.0f;
    
    /// Public property for animation delay.
    _animationDelay = 2.5f;
    
    /// Public property for animation options (transition effects).
    _animationOptions = UIViewAnimationOptionTransitionCrossDissolve;
}

/*!
 * @brief Animate an UIImageView with different images.
 * @param image An UIImage to add to the current slide show.
 */
- (void)addImage:(UIImage *)image;
{
    /// If the array is not initialized, we create it.
    if (!_images) {
        
        /// If it is not initialized.
        _images = [NSMutableArray arrayWithObject:image];
        
    } else {
        
        /// Add the new image to the array.
        [_images addObject:image];
    }
    
    /// If we have 2 images already, start the animation.
    /// If not, we just the first image to the UIImageView without animation.
    if ([_images count] == 2) {
        
        /// Animate.
        [self animateWithIndex:0];
        
    } else {
        
        /// Set the very first image.
        [self setImage:image];
    }
}

/*!
 * @brief Animate an UIImageView with different images.
 * @param index The index of the next image to display.
 */
- (void)animateWithIndex:(NSUInteger)index;
{
    /// Reset index.
    index = (index >= [_images count]) ? 0 : index;
    
    /// Animate with CrossDissolve effect.
    [UIView transitionWithView:self duration:_animationDurationTime options:_animationOptions animations:^{
        
        /// Set the next image.
        [self performSelectorOnMainThread:@selector(setImage:) withObject:_images[index] waitUntilDone:NO];
        
    } completion:^(BOOL finished) {
        
        /// Call after some delay.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, _animationDelay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            
            /// If we still have images, we recursively call the method again.
            if (_images && [_images count]) {
                [self animateWithIndex:index+1];
            }
        });
    }];
}

/*!
 * @brief Empty the array with images, this will stop animating.
 */
- (void)emptyImageArray
{
    _images = nil;
}

@end