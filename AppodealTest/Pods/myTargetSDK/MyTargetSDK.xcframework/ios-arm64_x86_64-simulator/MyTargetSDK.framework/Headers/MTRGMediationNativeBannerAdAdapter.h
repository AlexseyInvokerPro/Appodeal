//
//  MTRGMediationNativeBannerAdAdapter.h
//  myTargetSDK 5.15.0
//
//  Created by Andrey Seredkin on 11/06/2020.
//  Copyright © 2020 Mail.ru Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MyTargetSDK/MTRGMediationAdapter.h>
#import <MyTargetSDK/MTRGAdChoicesPlacement.h>

@class MTRGNativeBanner;
@class MTRGMediationNativeBannerAdConfig;
@protocol MTRGMediationNativeBannerAdAdapter;

NS_ASSUME_NONNULL_BEGIN

/**
 @discussion Native banner ad's delegate protocol.
 */
@protocol MTRGMediationNativeBannerAdDelegate <NSObject>

/**
 @discussion Calls on load ad for the banner.
 
 @param banner Current banner.
 @param adapter Current adapter.
 */
- (void)onLoadWithNativeBanner:(MTRGNativeBanner *)banner
					   adapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

/**
 @discussion Calls when there is no ad.
 
 @param reason The reason why there is no ad.
 @param adapter Current adapter.
 */
- (void)onNoAdWithReason:(NSString *)reason adapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

/**
 @discussion Calls on ad show.
 
 @param adapter Current adapter.
 */
- (void)onAdShowWithAdapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

/**
 @discussion Calls on click by the ad.
 
 @param adapter Current adapter.
 */
- (void)onAdClickWithAdapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

/**
 @discussion Calls on modal show.
 
 @param adapter Current adapter.
 */
- (void)onShowModalWithAdapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

/**
 @discussion Calls on modal dismiss.
 
 @param adapter Current adapter.
 */
- (void)onDismissModalWithAdapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

/**
 @discussion Calls on leaving application.
 
 @param adapter Current adapter.
 */
- (void)onLeaveApplicationWithAdapter:(id <MTRGMediationNativeBannerAdAdapter>)adapter;

@end

/**
 @discussion Class of native banner ad.
 */
@protocol MTRGMediationNativeBannerAdAdapter <MTRGMediationAdapter>

/**
 @discussion Delegate for the banner. Must conforms MTRGMediationNativeBannerAdDelegate protocol.
 */
@property(nonatomic, weak, nullable) id <MTRGMediationNativeBannerAdDelegate> delegate;

/**
 @discussion Loads ad with mediation configuration.
 
 @param mediationAdConfig Mediation ad configuration.
 */
- (void)loadWithMediationAdConfig:(MTRGMediationNativeBannerAdConfig *)mediationAdConfig;

/**
 @discussion Registers view for the adapter.
 
 @param containerView View for the adapter.
 @param controller Controller for the adapter.
 @param clickableViews Array of view which will be clickable.
 @param adChoicesPlacement Ad choices for the adapter.
 */
- (void)registerView:(UIView *)containerView
	  withController:(UIViewController *)controller
  withClickableViews:(nullable NSArray<UIView *> *)clickableViews
  adChoicesPlacement:(MTRGAdChoicesPlacement)adChoicesPlacement;

/**
 @discussion Unregisters view.
 */
- (void)unregisterView;

/**
 @discussion Returns instance of UIView for the icon of the banner.
 
 @return Instance of UIView.
 */
- (nullable UIView *)iconView;

@end

NS_ASSUME_NONNULL_END
