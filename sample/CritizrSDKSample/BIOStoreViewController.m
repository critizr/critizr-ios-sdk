//
//  BIOStoreViewController.m
//  Bolibio
//
//  Created by Ludovic Loridan on 3/2/15.
//  Copyright (c) 2015 Critizr. All rights reserved.
//

#import "BIOStoreViewController.h"

#import <Critizr/Critizr.h>

@implementation BIOStoreViewController


-(void)viewWillAppear:(BOOL)animated
{
    CRSdk *sdk = [CRSdk critizrSDKInstance:self];
    [sdk fetchRatingForPlace:@"velo-aix-en-provence" withDelegate:self];

    return [super viewWillAppear:animated];
}
- (IBAction)didTouchGiveFeedback:(id)sender {
    CRFeedbackDialog *feedbackDialog = [CRFeedbackDialog feedbackDialog];
    NSString *storeID = @"velo-aix-en-provence";
    NSDictionary *params = @{
                             @"mode" : @"feedback",
                             @"user" : @"YXJuYXVkfGFybmF1ZC5sYW5jZWxvdEBjcml0aXpyLmNvbQ=="
                             // user correspond à arnaud|arnaud.lancelot@critizr.com encodé en BASE64
                             };
    [feedbackDialog presentFeedbackDialogFrom:self withStoreIdString:storeID withParams:params];
}

#pragma mark CRSDKDelegate

-(void)critizrPlaceRatingFetched:(double)aPlaceRating
{
    NSLog(@"Rating -> %f", aPlaceRating);
}

-(void) critizrPlaceRatingError:(NSError *)anError {}


@end
