//
//  LandingViewController.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFLandingViewController.h"
#import "TFFacilityDetailViewController.h"
#import "TFLineTableViewCell.h"
#import "TFStationCell.h"

@interface TFLandingViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@property (strong, nonatomic) IBOutlet UIView *errorView;
@property (strong, nonatomic) IBOutlet UILabel *errorMessageLabel;

@end

@implementation TFLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib: [UINib nibWithNibName: [TFLineTableViewCell reuseIdentifier] bundle: nil] forCellReuseIdentifier: [TFLineTableViewCell reuseIdentifier]];
    [self.tableView registerNib: [UINib nibWithNibName: [TFStationCell reuseIdentifier] bundle: nil] forCellReuseIdentifier: [TFStationCell reuseIdentifier]];

    
    self.tableView.delegate = self.presenter;
    self.tableView.dataSource = self.presenter;
    
    [self.presenter findMyLocation];

    [self hideErrorView];
    [self showLoadingView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData]; // todo: this is used to deselect facility tiles. It's not the most efficient way of doing it though, and could be improved
}

- (void)refreshView {
    [self hideLoadingView];
    [self.tableView reloadData];
}

- (void)showLoadingView {
    [self.loader setHidden: NO];
    [self.loader startAnimating];
    [self.errorView setHidden: YES];
}

- (void)hideLoadingView {
    [self.loader setHidden: YES];
    [self.loader stopAnimating];
}

- (void)showErrorView:(NSString*) message{
    [self hideLoadingView];
    [self.errorView setHidden: NO];
    [self.errorMessageLabel setText: message];
}

- (void)hideErrorView {
    [self hideLoadingView];
    [self.errorView setHidden: YES];
}

- (void)presentFacility:(TFAdditionalProperties*) properties {
    [self.navigationController pushViewController:[[TFFacilityDetailViewController alloc] initWithFacility: properties] animated: YES];
}

@end
