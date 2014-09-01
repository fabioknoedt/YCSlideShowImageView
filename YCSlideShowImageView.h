//
//  YCSlideShowView.h
//  YU - YUPPIU
//
//  Created by Fabio Knoedt on 11/08/14.
//  Copyright (c) 2014 Datedicted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCSlideShowImageView : UIImageView

/*!
 * @brief Animate an UIImageView with different images.
 * @param image An UIImage to add to the current slide show.
 */
- (void)addImage:(UIImage *)image;

/*!
 * @brief Empty the array with images, this will stop animating.
 */
- (void)emptyImageArray;

@end
