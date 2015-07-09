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
    CRSdk *sdk = [CRSdk critizrSDKInstanceWithAPIKey:@"3f672def9b5902a4eb4ab5c936bc7b0d" andDelegate:self];
    [sdk fetchRatingForPlace:@"8" withDelegate:self];

    return [super viewWillAppear:animated];
}
- (IBAction)didTouchGiveFeedback:(id)sender {
    CRFeedbackDialog *critizrDialog = [CRFeedbackDialog feedbackDialogWithAPIKey:@"3f672def9b5902a4eb4ab5c936bc7b0d"];
    [critizrDialog presentFeedbackDialogFrom:self withStoreId:8];
}

#pragma mark CRSDKDelegate

-(void)critizrPlaceRatingFetched:(double)aPlaceRating
{
    
}

-(void) critizrPlaceRatingError:(NSError *)anError {
    
}


@end
