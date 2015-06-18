YCSlideShowImageView
====================
[![Pod Version](http://img.shields.io/cocoapods/v/YCSlideShowImageView.svg?style=flat)](http://cocoadocs.org/docsets/YCSlideShowImageView/)
[![Pod Platform](http://img.shields.io/cocoapods/p/YCSlideShowImageView.svg?style=flat)](http://cocoadocs.org/docsets/YCSlideShowImageView/)
[![Pod License](http://img.shields.io/cocoapods/l/YCSlideShowImageView.svg?style=flat)](https://github.com/yuppiu/YCSlideShowImageView/blob/master/LICENSE)
[![Dependency Status](https://www.versioneye.com/objective-c/YCSlideShowImageView/1.1.1/badge.svg?style=flat)](https://www.versioneye.com/objective-c/YCSlideShowImageView)

A very simple subclass of UIImageView with the option to animate like a Slide Show between 2+ images.

![alt tag](http://www.zonanews.it/images/slideshow.gif)

Usage
------------

MyExample.m

	@interface MyExample ()

	@property (nonatomic, weak) IBOutlet YCSlideShowImageView *imageView;

	@end

	@implementation MyExample

	- (void)aMethod {

		/// Run in a loop of image URLs OR in a loop of stored images.
        for (NSString *imageURL in _imageURLs) {

        	/// Here we start the download using AFNetworking (just an example). You can use any downloader.
			NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]];
			AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
			requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
			[requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
			    
				/// Here we add each downloaded image to the Slide Show.
			    [_imageView addImage:image];

			} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			    NSLog(@"Image error: %@", error);
			}];
			[requestOperation start];
		}
	}

	@end

If you want to reset the animation, just call:

	[_imageView emptyImageArray];
	
There are 3 public properties that you can use to customize the animation duration (animationDurationTime), the delay between the transitions (animationDelay) and also the options of the animation (animationOptions).

	CGFloat animationDurationTime;
	CGFloat animationDelay;
	UIViewAnimationOptions animationOptions;
	

Support
------------	
	
Runs fine in iOS6+ and supports ARC.
	
Contributors
------------

<img align="right" style="float: right" src="https://travis-ci.com/img/made-in-berlin-badge.png" alt="Made in Berlin" />
* [Fabio Knoedt](https://github.com/fabioknoedt)
* Rubén Xifré
