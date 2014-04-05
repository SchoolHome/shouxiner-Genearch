//
//  CPPetManager.h
//  iCouple
//
//  Created by yl s on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPUIModelPetActionAnim.h"
#import "CPUIModelPetMagicAnim.h"
#import "CPUIModelPetFeelingAnim.h"
#import "CPUIModelPetSmallAnim.h"

#import "CPHttpEngineObserver.h"

typedef enum
{
    K_PETRES_DLDTYPE_UNKNOWN = 0,
    K_PETRES_DLDTYPE_NORMAL = 1,
    K_PETRES_DLDTYPE_DLALL = 2,
}PetResDldType;

@class CPDBModelPetInfo;
@class CPDBModelPetData;

@interface CPPetManager : NSObject<CPHttpEngineObserver>

- (void)initPetData;

- (NSArray *)allActionObjects;
- (CPUIModelPetActionAnim *)actionObjectOfID:(NSString *)resID;

- (NSArray *)allMagicObjects;
- (CPUIModelPetMagicAnim *)magicObject:(NSString *)resId ofPet:(NSString *)petID;

//- (NSArray *)allFeelingObjects;
- (NSDictionary *)allFeelingObjects;
#if 0
- (CPUIModelPetFeelingAnim *)feelingObjectOfID:(NSString *)resID;
#endif
- (CPUIModelPetFeelingAnim *)feelingObject:(NSString *)resID ofPet:(NSString *)petID;

- (NSArray *)allSmallAnimObjects;
- (CPUIModelPetSmallAnim *)smallAnimObectOfID:(NSString *)resID;
- (CPUIModelPetSmallAnim *)smallAnimObectOfEscapeChar:(NSString *)escChar;

- (void)downloadPetRes:(NSString *)resID ofPet:(NSString *)petID;
- (void)downloadAllPetResForV06:(NSString *)petID;
- (BOOL)isAllFeelingResAvailable;
- (void)downloadAllFeelingResForV06:(NSString *)petID;
- (void)tempUpdateRes:(CPDBModelPetData *)data;

//private!
- (void)addNewPetInfo:(CPDBModelPetInfo *)petInfo;
//private!
- (void)downloadPetAllRes:(NSString *)petID;
//private!
- (void)clearDownloadInfo:(NSString *)resID ofPet:(NSString *)petID;

- (void)downloadPetResOf:(NSString *)resID
                    from:(NSString *)remoteURL
                  foFile:(NSString *)dstFile
           andContextObj:(NSObject *)contextObj;

//private.
- (void)setFeelingAnimDldStatus:(PetResDownloadStatus)status ofRes:(NSString *)resID andPet:(NSString *)petID;
- (void)setMagicAnimDldStatus:(PetResDownloadStatus)status ofRes:(NSString *)resID andPet:(NSString *)petID;
//private.
- (void)startInitialDld;
//private.
- (void)clearCache;

@end
