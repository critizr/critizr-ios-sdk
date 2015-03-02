//
//  BIOHomeViewController.m
//  Bolibio
//
//  Created by Ludovic Loridan on 3/2/15.
//  Copyright (c) 2015 Critizr. All rights reserved.
//

#import "BIOHomeViewController.h"

@implementation BIOHomeViewController

- (IBAction)didTouchGiveFeedback:(id)sender {
    CRFeedbackWidget *critizrWidget = [CRFeedbackWidget feedbackWidgetWithAPIKey:@"15a2e2ea8b794e977e28f8534929ebe7"];
    [critizrWidget presentFeedbackWidgetFrom:self];
}

#pragma mark - Feedback Widget Delegate

/* OPTIONAL : Implementing CRFeedbackWidgetDelegate.
   If your View Controller conforms the CRFeedbackWidgetDelegate protocol, this method is gonna be called after the widget is closed.
*/

- (void) feedbackWidgetDidCloseWithMessageSent:(BOOL)messageSent {
    if (messageSent) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CRFeedbackWidgetDelegate Demo" message:@"Merci d'avoir envoyé un message !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CRFeedbackWidgetDelegate Demo" message:@"Vous venez de quitter le widget Critizr. Essayez maintenant d'envoyer un message !" delegate:nil cancelButtonTitle:@"OK !" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
