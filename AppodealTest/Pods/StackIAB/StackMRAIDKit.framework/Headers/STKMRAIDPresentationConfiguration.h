//
//  AMKPresentationConfiguration.h
//
//  Copyright © 2019 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StackIABAssets/StackIABAssets.h>


NS_ASSUME_NONNULL_BEGIN

@interface STKMRAIDPresentationConfiguration : NSObject <NSCopying>

@property (nonatomic, assign) NSTimeInterval closeTime;
@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, assign) BOOL useNativeClose;
@property (nonatomic, assign) BOOL r1;
@property (nonatomic, assign) BOOL r2;
@property (nonatomic, assign) BOOL ignoresSafeAreaLayout;

@property (nonatomic, copy, nullable) NSString *productLink;
@property (nonatomic, copy, nullable) UIColor *backgroundColor;

@property (nonatomic, copy) STKIABAsset *countdownAsset;
@property (nonatomic, copy) STKIABAsset *closableAsset;
@property (nonatomic, copy) STKIABAsset *progressAsset;

@property (nonatomic, copy, nullable) NSDictionary <NSString *, NSString *> *productParameters;

@end

NS_ASSUME_NONNULL_END
