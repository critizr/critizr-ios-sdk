//
//  CRWidget.h
//  Critizr
//
//  Created by Ludovic Loridan on 2/25/15.
//  Copyright (c) 2015 Critizr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRFeedbackWidgetDelegate <NSObject>

@optional
- (void) feedbackWidgetDidCloseWithMessageSent:(BOOL)messageSent;

@end

@interface CRFeedbackWidget : NSObject

+ (CRFeedbackWidget *) feedbackWidgetWithAPIKey: (NSString *) APIKey;

- (void) presentFeedbackWidgetFrom:(UIViewController *) viewController;
- (void) presentFeedbackWidgetFrom:(UIViewController *) viewController withStoreId:(NSString *)storeId;

@end
