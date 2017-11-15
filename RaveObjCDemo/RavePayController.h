//
//  RavePayController.h
//  RaveObjCDemo
//
//  Created by Olusegun Solaja on 26/09/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RaveObjCDemo-Swift.h"
#import "Constants.h"

@interface RavePayController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *cardViewContainer;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UITextField *cardAmount;

@property (weak, nonatomic) IBOutlet UITextField *cardNumber;
@property (weak, nonatomic) IBOutlet UITextField *expiry;
@property (weak, nonatomic) IBOutlet UITextField *cvv;
@property (weak, nonatomic) IBOutlet UIButton *chooseCardsButton;
@property (weak, nonatomic) IBOutlet UISwitch *saveCardSwitch;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeight;
@property (strong, nonatomic) IBOutlet UIView *accountContainer;
@property (weak, nonatomic) IBOutlet UITextField *accountAmount;

@property (weak, nonatomic) IBOutlet UITextField *bankNAme;
@property (weak, nonatomic) IBOutlet UITextField *accountNumber;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet CustomSegementControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UIView *mpesaContainer;

@property (weak, nonatomic) IBOutlet UILabel *businessNumber;
@property (weak, nonatomic) IBOutlet UILabel *mpesaAccountNumber;


@end
