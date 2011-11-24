//
//  MainViewController.h
//  WebViewTest
//
//  Created by jinwoo choi on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate> {
    UIWebView *webView;
    UITextField *url;
    UIActivityIndicatorView *accel;
}

- (void)inputReturnHandler:(id *)sender;
- (void)changeWebViewUrl:(NSString *)urlStr;


@end
