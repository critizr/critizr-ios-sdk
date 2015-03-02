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
    CRFeedbackDialog *critizrDialog = [CRFeedbackDialog feedbackDialogWithAPIKey:@"15a2e2ea8b794e977e28f8534929ebe7"];
    [critizrDialog presentFeedbackDialogFrom:self];
}

#pragma mark - Feedback Dialog Delegate

/* OPTIONAL : Implementing CRFeedbackDialogDelegate.
 If your View Controller conforms the CRFeedbackDialogDelegate protocol, this method is gonna be called after the dialog is closed.
 */

- (void) feedbackDialogDidCloseWithMessageSent:(BOOL)messageSent {
    if (messageSent) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CRFeedbackDialogDelegate Demo" message:@"Merci d'avoir envoyé un message !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CRFeedbackDialogDelegate Demo" message:@"Vous venez de quitter la boite de dialogue Critizr. Essayez maintenant d'envoyer un message !" delegate:nil cancelButtonTitle:@"OK !" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
