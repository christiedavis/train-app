//
//  TFLandingPresenter.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFLandingPresenter.h"
#import "TFRepositoryFactory.h"

@interface TFLandingPresenter()

@property (strong, nonatomic) TFRepositoryFactory* repoFactory;
//@property (strong, nonatomic) TISearchMetaData* searchMetadata;

//@property (strong, nonatomic) NSArray<TITweet*>* tweets;
//@property (strong, nonatomic) NSString* hashTag;

@end


@implementation TFLandingPresenter

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.repoFactory = [[TFRepositoryFactory alloc] init];
//    self.tweets = @[];
//    self.hashTag = @"lovewhereyouwork";
    return self;
}

//- (void)getImages {
//    [self getImages: self.hashTag];
//}
//
//- (void)getImages: (NSString*)hashtag {
//
//    if (hashtag.length > 0) {
//        self.hashTag = [hashtag stringByReplacingOccurrencesOfString: @"#" withString: @""];
//    }
//
//    [self.service getImagesWithHashtag: self.hashTag Callback:^(TITweetSearchResponse *response, NSError *error) {
//        if (error) {
//            [self.view showErrorView: @"Error: loading of images failed"];
//
//        } else {
//
//            NSMutableArray *tempTweetArray = [[NSMutableArray alloc] init];
//
//            for (TITweet *tweet in response.statuses) {
//                if ([tweet isValidTweet]) {
//                    [tempTweetArray addObject: tweet];
//                    NSLog(@"%@: %@", tweet.user.screenName, [tweet.extendedEntities.media[0] mediaUrl]);
//
//                }
//            }
//            self.tweets = tempTweetArray;
//            self.searchMetadata = response.searchMetaData;
//
//            [self.view refreshView];
//            [self.view hideLoadingView];
//        }
//    }];
//}

// MARK: Table View Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

// MARK: Search Bar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [self.view dismissKeyboard];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.view dismissKeyboard];
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.view activateTapGestureRecognizer];
}

@end
