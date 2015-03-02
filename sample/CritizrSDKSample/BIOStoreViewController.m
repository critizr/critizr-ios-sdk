//
//  BIOStoreViewController.m
//  Bolibio
//
//  Created by Ludovic Loridan on 3/2/15.
//  Copyright (c) 2015 Critizr. All rights reserved.
//

#import "BIOStoreViewController.h"

@implementation BIOStoreViewController

- (IBAction)didTouchGiveFeedback:(id)sender {
    CRFeedbackWidget *critizrWidget = [CRFeedbackWidget feedbackWidgetWithAPIKey:@"15a2e2ea8b794e977e28f8534929ebe7"];
    [critizrWidget presentFeedbackWidgetFrom:self withStoreId:@"8"];
}

@end
