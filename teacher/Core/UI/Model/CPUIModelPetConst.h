//
//  CPUIModelPetConst.h
//  iCouple
//
//  Created by yl s on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef iCouple_CPUIModelPetConst_h
#define iCouple_CPUIModelPetConst_h

typedef enum {

    K_PET_DATA_TYPE_UNKNOWN = 0,
    K_PET_DATA_TYPE_ACTION = 1,
    K_PET_DATA_TYPE_FEELING = 2,
    K_PET_DATA_TYPE_MAGIC = 3,
    K_PET_DATA_TYPE_SMALLANIM = 4,
}PetDataType;

typedef enum {

    K_FEELING_TYPE_UNKNOWN = 0,
    K_FEELING_TYPE_LOVE = 1,
    K_FEELING_TYPE_HAPPY = 2,
    K_FEELING_TYPE_SAD = 3,
}FeelingType;

typedef enum {

    K_PETRES_DOWNLOAD_TYPE_PETCFG = 1,
    K_PETRES_DOWNLOAD_TYPE_PETRES = 2,
}PetResDownloadType;

typedef enum
{

//    K_PETRES_DOWNLOD_STATUS_DEFAULT = 0,
//    K_PETRES_DOWNLOD_STATUS_PENDING = 1,
    K_PETRES_DOWNLOD_STATUS_DOWNLOADING = 2,
//    K_PETRES_DOWNLOD_STATUS_DOWNLOAD_SUCCESS = 3,
//    K_PETRES_DOWNLOD_STATUS_DOWNLOAD_FAILED = 4,
}PetResDownloadStatus;

typedef enum
{
    
    K_PETRES_MARK_TYPE_UNKNOWN = 0,
    K_PETRES_MARK_TYPE_ClEAR = 1,
    K_PETRES_MARK_TYPE_DOWNLOADING = 2,
}PetResMarkType;

#endif
