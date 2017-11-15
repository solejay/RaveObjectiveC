//
//  RavePayController.m
//  RaveObjCDemo
//
//  Created by Olusegun Solaja on 26/09/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import "RavePayController.h"
#import "UIColor+HexString.h"

@interface RavePayController ()

@end

@implementation RavePayController
@synthesize segmentedControl;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

-(void) configureView{
    [self.containerView addSubview:_cardViewContainer];
    [self.containerView addSubview:_accountContainer];
    [self.containerView addSubview:_mpesaContainer];
    [_accountContainer setHidden:YES];
    [_mpesaContainer setHidden:YES];
    
    [self styleTextField:self.cardAmount];
    [self styleTextField:self.cardNumber];
    [self styleTextField:self.expiry];
    [self styleTextField:self.cvv];
    
    [self styleTextField:self.accountNumber];
    [self styleTextField:self.accountAmount];
    [self styleTextField:self.bankNAme];
    [self styleTextField:self.phoneNumber];
    self.containerView.layer.borderColor = [[UIColor colorWithHexString:@"#DADADA"] CGColor];
    self.containerView.layer.borderWidth = 1;
    self.containerView.layer.cornerRadius = 4;
    self.containerHeight.constant = 315 - 45;
    
    [segmentedControl addTarget:self action:@selector(segementedControlTapped:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setButtonTitles:[Constants paymentMethodFor:NGN]];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.cardViewContainer.frame = self.containerView.bounds;
    self.accountContainer.frame = self.containerView.bounds;
    self.mpesaContainer.frame = self.containerView.bounds;

}

-(void)styleTextField:(UITextField *) textfield{
    textfield.layer.cornerRadius = 4;
    textfield.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)];
    textfield.leftViewMode = UITextFieldViewModeAlways;
    textfield.layer.borderColor = [[UIColor colorWithHexString:@"#DADADA"] CGColor];
    textfield.layer.borderWidth = 1;
}

-(void) segementedControlTapped:(CustomSegementControl*) sender{
    [self determineViewToShow:sender.selectedIndex forCountry:NGN];
}

-(void) determineViewToShow:(NSInteger) index forCountry:(Country) country {
    switch (index) {
        case 0:
            switch (country) {
                case NGN:
                    [_cardViewContainer setHidden:NO];
                    [_accountContainer setHidden:YES];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
        
                case KES:
                    [_cardViewContainer setHidden:NO];
                    [_accountContainer setHidden:YES];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                   
                case USD:
                    [_cardViewContainer setHidden:NO];
                    [_accountContainer setHidden:YES];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                
                case GHS:
                    [_cardViewContainer setHidden:NO];
                    [_accountContainer setHidden:YES];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
              
                default:
                    break;
            }
            break;
        case 1:
            switch (country) {
                case NGN:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                    
                case KES:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:YES];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:NO];
                    break;

                case USD:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                case GHS:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (country) {
                case NGN:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                case KES:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                   break;
                case USD:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                   break;
                case GHS:
                    [_cardViewContainer setHidden:YES];
                    [_accountContainer setHidden:NO];
                    self.containerHeight.constant = 315 - 45;
                    [_mpesaContainer setHidden:YES];
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"RAVE";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
