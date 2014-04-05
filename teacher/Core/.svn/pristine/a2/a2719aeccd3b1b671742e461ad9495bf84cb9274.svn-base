//
//  CPDAOPetInfo.m
//  iCouple
//
//  Created by yl s on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPDAOPetInfo.h"

#import "CPDBModelPetInfo.h"
#import "CPDBModelPetData.h"

#define K_PET_LOCAL_ID              @"id"
#define K_PET_ID                    @"pet_id"
#define K_PET_NAME                  @"pet_name"

#define K_DATA_LOCAL_ID             @"id"
#define K_DATA_ID                   @"data_id"
#define K_DATA_TYPE                 @"data_type"
#define K_DATA_REF_PET_LOCAL_ID     @"pet_local_id"
#define K_DATA_REMOTE_URL           @"remote_url"
#define K_DATA_LOCAL_PATH           @"local_path"

@implementation CPDAOPetInfo

- (void)initDefautlData
{
    [db beginTransaction];
    
    NSString *petResID = @"pet_default";
    NSString *dir = [[NSBundle mainBundle] bundlePath];
    NSNumber *mark = [NSNumber numberWithInt:1];//ref : PetResMarkType
    
    //init default pet info++
    CPDBModelPetInfo *petInfo = [[CPDBModelPetInfo alloc] init];
    petInfo.petID = @"pet_default";
    petInfo.petName = @"xiaoshuang";
    petInfo.isDefault = [NSNumber numberWithInt:1];
    petInfo.localPath = dir;
    petInfo.remoteURL = @"/static/pet_default.cfg";
    petInfo.mark = mark;
    
    NSNumber *petLocalId = [self insertPetInfo:petInfo];
    //init default pet info--
    
    //init default pet data++
    
    //action++
    CPDBModelPetData *action_shuohua = [[CPDBModelPetData alloc] init];
    action_shuohua.dataID = @"shuohua";
    action_shuohua.dataType = [NSNumber numberWithInt:1];//@"action";
    action_shuohua.dataSize = [NSNumber numberWithInt:705];
    action_shuohua.petID = petLocalId;
    action_shuohua.petResID = petResID;
    action_shuohua.name = @"说话";
    action_shuohua.thumb = [NSString stringWithFormat:@"%@/shuohua_thumb@2x.gif", dir];
    action_shuohua.remoteURL = @"";
    action_shuohua.localPath = dir;
    action_shuohua.isDefault = [NSNumber numberWithInt:1];
    action_shuohua.isAvailable = [NSNumber numberWithInt:1];
    action_shuohua.mark = mark;
    
    [self insertPetData:action_shuohua];
    
    CPDBModelPetData *action_ting = [[CPDBModelPetData alloc] init];
    action_ting.dataID = @"ting";
    action_ting.dataType = [NSNumber numberWithInt:1];//@"action";
    action_ting.dataSize = [NSNumber numberWithInt:855];
    action_ting.petID = petLocalId;
    action_ting.petResID = petResID;
    action_ting.name = @"听";
    action_ting.thumb = [NSString stringWithFormat:@"%@/ting_thumb@2x.gif", dir];
    action_ting.remoteURL = @"";
    action_ting.localPath = dir;
    action_ting.isDefault = [NSNumber numberWithInt:1];
    action_ting.isAvailable = [NSNumber numberWithInt:1];
    action_ting.mark = mark;
    
    [self insertPetData:action_ting];
    
    CPDBModelPetData *action_zhanli = [[CPDBModelPetData alloc] init];
    action_zhanli.dataID = @"zhanli";
    action_zhanli.dataType = [NSNumber numberWithInt:1];//@"action";
    action_zhanli.dataSize = [NSNumber numberWithInt:884];
    action_zhanli.petID = petLocalId;
    action_zhanli.petResID = petResID;
    action_zhanli.name = @"站立";
    action_zhanli.thumb = [NSString stringWithFormat:@"%@/zhanli_thumb@2x.gif", dir];
    action_zhanli.remoteURL = @"";
    action_zhanli.localPath = dir;
    action_zhanli.isDefault = [NSNumber numberWithInt:1];
    action_zhanli.isAvailable = [NSNumber numberWithInt:1];
    action_zhanli.mark = mark;
    
    [self insertPetData:action_zhanli];
    //action--
    
    //feeling++
    
    CPDBModelPetData *feeling_aini = [[CPDBModelPetData alloc] init];
    feeling_aini.dataID = @"aini";
    feeling_aini.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_aini.dataSize = [NSNumber numberWithInt:1740];
    feeling_aini.category = [NSNumber numberWithInt:1];
    feeling_aini.petID = petLocalId;
    feeling_aini.petResID = petResID;
    feeling_aini.name = @"爱你";
    feeling_aini.thumb = [NSString stringWithFormat:@"%@/aini_QP@2x.gif", dir];
    feeling_aini.remoteURL = @"/static/iphone/aini.zip";
    feeling_aini.localPath = dir;
    feeling_aini.isDefault = [NSNumber numberWithInt:1];
    feeling_aini.isAvailable = [NSNumber numberWithInt:0];
    feeling_aini.mark = mark;
    
    [self insertPetData:feeling_aini];
    
    CPDBModelPetData *feeling_xiangni = [[CPDBModelPetData alloc] init];
    feeling_xiangni.dataID = @"xiangni";
    feeling_xiangni.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_xiangni.dataSize = [NSNumber numberWithInt:1228];
    feeling_xiangni.category = [NSNumber numberWithInt:1];
    feeling_xiangni.petID = petLocalId;
    feeling_xiangni.petResID = petResID;
    feeling_xiangni.name = @"想你";
    feeling_xiangni.thumb = [NSString stringWithFormat:@"%@/xiangni_QP@2x.gif", dir];
    feeling_xiangni.remoteURL = @"/static/iphone/xiangni.zip";
    feeling_xiangni.localPath = dir;
    feeling_xiangni.isDefault = [NSNumber numberWithInt:1];
    feeling_xiangni.isAvailable = [NSNumber numberWithInt:0];
    feeling_xiangni.mark = mark;
    
    [self insertPetData:feeling_xiangni];
    
    CPDBModelPetData *feeling_xinkula = [[CPDBModelPetData alloc] init];
    feeling_xinkula.dataID = @"xinkula";
    feeling_xinkula.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_xinkula.dataSize = [NSNumber numberWithInt:1530];
    feeling_xinkula.category = [NSNumber numberWithInt:1];
    feeling_xinkula.petID = petLocalId;
    feeling_xinkula.petResID = petResID;
    feeling_xinkula.name = @"辛苦";
    feeling_xinkula.thumb = [NSString stringWithFormat:@"%@/xinkula_QP@2x.gif", dir];
    feeling_xinkula.remoteURL = @"/static/iphone/xinkula.zip";
    feeling_xinkula.localPath = dir;
    feeling_xinkula.isDefault = [NSNumber numberWithInt:1];
    feeling_xinkula.isAvailable = [NSNumber numberWithInt:0];
    feeling_xinkula.mark = mark;
    
    [self insertPetData:feeling_xinkula];
    
    CPDBModelPetData *feeling_qinyige = [[CPDBModelPetData alloc] init];
    feeling_qinyige.dataID = @"qinyige";
    feeling_qinyige.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_qinyige.dataSize = [NSNumber numberWithInt:321];
    feeling_qinyige.category = [NSNumber numberWithInt:1];
    feeling_qinyige.petID = petLocalId;
    feeling_qinyige.petResID = petResID;
    feeling_qinyige.name = @"亲亲";
    feeling_qinyige.thumb = [NSString stringWithFormat:@"%@/qinyige_QP@2x.gif", dir];
    feeling_qinyige.remoteURL = @"/static/iphone/qinyige.zip";
    feeling_qinyige.localPath = dir;
    feeling_qinyige.isDefault = [NSNumber numberWithInt:1];
    feeling_qinyige.isAvailable = [NSNumber numberWithInt:0];
    feeling_qinyige.mark = mark;
    
    [self insertPetData:feeling_qinyige];
    
    CPDBModelPetData *feeling_xxoo = [[CPDBModelPetData alloc] init];
    feeling_xxoo.dataID = @"xo";
    feeling_xxoo.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_xxoo.dataSize = [NSNumber numberWithInt:1126];
    feeling_xxoo.category = [NSNumber numberWithInt:1];
    feeling_xxoo.petID = petLocalId;
    feeling_xxoo.petResID = petResID;
    feeling_xxoo.name = @"xxoo";
    feeling_xxoo.thumb = [NSString stringWithFormat:@"%@/xxoo_QP@2x.gif", dir];
    feeling_xxoo.remoteURL = @"/static/iphone/xxoo.zip";
    feeling_xxoo.localPath = dir;
    feeling_xxoo.isDefault = [NSNumber numberWithInt:1];
    feeling_xxoo.isAvailable = [NSNumber numberWithInt:0]; // 1
    feeling_xxoo.mark = mark;
    
    [self insertPetData:feeling_xxoo];
    
    CPDBModelPetData *feeling_zanmeini = [[CPDBModelPetData alloc] init];
    feeling_zanmeini.dataID = @"zanmeini";
    feeling_zanmeini.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_zanmeini.dataSize = [NSNumber numberWithInt:1228];
    feeling_zanmeini.category = [NSNumber numberWithInt:2];
    feeling_zanmeini.petID = petLocalId;
    feeling_zanmeini.petResID = petResID;
    feeling_zanmeini.name = @"赞美";
    feeling_zanmeini.thumb = [NSString stringWithFormat:@"%@/zanmeini_QP@2x.gif", dir];
    feeling_zanmeini.remoteURL = @"/static/iphone/zanmeini.zip";
    feeling_zanmeini.localPath = dir;
    feeling_zanmeini.isDefault = [NSNumber numberWithInt:1];
    feeling_zanmeini.isAvailable = [NSNumber numberWithInt:0];
    feeling_zanmeini.mark = mark;
    
    [self insertPetData:feeling_zanmeini];
    
    CPDBModelPetData *feeling_maimeng = [[CPDBModelPetData alloc] init];
    feeling_maimeng.dataID = @"maimeng";
    feeling_maimeng.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_maimeng.dataSize = [NSNumber numberWithInt:3072];
    feeling_maimeng.category = [NSNumber numberWithInt:2];
    feeling_maimeng.petID = petLocalId;
    feeling_maimeng.petResID = petResID;
    feeling_maimeng.name = @"卖萌";
    feeling_maimeng.thumb = [NSString stringWithFormat:@"%@/maimeng_QP@2x.gif", dir];
    feeling_maimeng.remoteURL = @"/static/iphone/maimeng.zip";
    feeling_maimeng.localPath = dir;
    feeling_maimeng.isDefault = [NSNumber numberWithInt:1];
    feeling_maimeng.isAvailable = [NSNumber numberWithInt:0];
    feeling_maimeng.mark = mark;
    
    [self insertPetData:feeling_maimeng];
    
    CPDBModelPetData *feeling_tingnide = [[CPDBModelPetData alloc] init];
    feeling_tingnide.dataID = @"tingnide";
    feeling_tingnide.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_tingnide.dataSize = [NSNumber numberWithInt:793];
    feeling_tingnide.category = [NSNumber numberWithInt:2];
    feeling_tingnide.petID = petLocalId;
    feeling_tingnide.petResID = petResID;
    feeling_tingnide.name = @"从了";
    feeling_tingnide.thumb = [NSString stringWithFormat:@"%@/tingnide_QP@2x.gif", dir];
    feeling_tingnide.remoteURL = @"/static/iphone/tingnide.zip";
    feeling_tingnide.localPath = dir;
    feeling_tingnide.isDefault = [NSNumber numberWithInt:1];
    feeling_tingnide.isAvailable = [NSNumber numberWithInt:1];
    feeling_tingnide.mark = mark;
    
    [self insertPetData:feeling_tingnide];
    
    CPDBModelPetData *feeling_lei = [[CPDBModelPetData alloc] init];
    feeling_lei.dataID = @"lei";
    feeling_lei.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_lei.dataSize = [NSNumber numberWithInt:941];
    feeling_lei.category = [NSNumber numberWithInt:3];
    feeling_lei.petID = petLocalId;
    feeling_lei.petResID = petResID;
    feeling_lei.name = @"累";
    feeling_lei.thumb = [NSString stringWithFormat:@"%@/lei_QP@2x.gif", dir];
    feeling_lei.remoteURL = @"/static/iphone/lei.zip";
    feeling_lei.localPath = dir;
    feeling_lei.isDefault = [NSNumber numberWithInt:1];
    feeling_lei.isAvailable = [NSNumber numberWithInt:0];
    feeling_lei.mark = mark;
    
    [self insertPetData:feeling_lei];
    
    CPDBModelPetData *feeling_daoqian = [[CPDBModelPetData alloc] init];
    feeling_daoqian.dataID = @"daoqian";
    feeling_daoqian.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_daoqian.dataSize = [NSNumber numberWithInt:1228];
    feeling_daoqian.category = [NSNumber numberWithInt:3];
    feeling_daoqian.petID = petLocalId;
    feeling_daoqian.petResID = petResID;
    feeling_daoqian.name = @"道歉";
    feeling_daoqian.thumb = [NSString stringWithFormat:@"%@/daoqian_QP@2x.gif", dir];
    feeling_daoqian.remoteURL = @"/static/iphone/daoqian.zip";
    feeling_daoqian.localPath = dir;
    feeling_daoqian.isDefault = [NSNumber numberWithInt:1];
    feeling_daoqian.isAvailable = [NSNumber numberWithInt:0];
    feeling_daoqian.mark = mark;
    
    [self insertPetData:feeling_daoqian];
    
    CPDBModelPetData *feeling_shengqi = [[CPDBModelPetData alloc] init];
    feeling_shengqi.dataID = @"shengqi";
    feeling_shengqi.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_shengqi.dataSize = [NSNumber numberWithInt:1331];
    feeling_shengqi.category = [NSNumber numberWithInt:3];
    feeling_shengqi.petID = petLocalId;
    feeling_shengqi.petResID = petResID;
    feeling_shengqi.name = @"生气";
    feeling_shengqi.thumb = [NSString stringWithFormat:@"%@/shengqi_QP@2x.gif", dir];
    feeling_shengqi.remoteURL = @"/static/iphone/shengqi.zip";
    feeling_shengqi.localPath = dir;
    feeling_shengqi.isDefault = [NSNumber numberWithInt:1];
    feeling_shengqi.isAvailable = [NSNumber numberWithInt:0];
    feeling_shengqi.mark = mark;
    
    [self insertPetData:feeling_shengqi];
    
    CPDBModelPetData *feeling_gudan = [[CPDBModelPetData alloc] init];
    feeling_gudan.dataID = @"gudan";
    feeling_gudan.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_gudan.dataSize = [NSNumber numberWithInt:1331];
    feeling_gudan.category = [NSNumber numberWithInt:3];
    feeling_gudan.petID = petLocalId;
    feeling_gudan.petResID = petResID;
    feeling_gudan.name = @"孤单";
    feeling_gudan.thumb = [NSString stringWithFormat:@"%@/gudan_QP@2x.gif", dir];
    feeling_gudan.remoteURL = @"/static/iphone/gudan.zip";
    feeling_gudan.localPath = dir;
    feeling_gudan.isDefault = [NSNumber numberWithInt:1];
    feeling_gudan.isAvailable = [NSNumber numberWithInt:0];
    feeling_gudan.mark = mark;
    
    [self insertPetData:feeling_gudan];
    
    CPDBModelPetData *feeling_yalida = [[CPDBModelPetData alloc] init];
    feeling_yalida.dataID = @"yalida";
    feeling_yalida.dataType = [NSNumber numberWithInt:2];//@"feeling";
    feeling_yalida.dataSize = [NSNumber numberWithInt:668];
    feeling_yalida.category = [NSNumber numberWithInt:3];
    feeling_yalida.petID = petLocalId;
    feeling_yalida.petResID = petResID;
    feeling_yalida.name = @"压力";
    feeling_yalida.thumb = [NSString stringWithFormat:@"%@/yalida_QP@2x.gif", dir];
    feeling_yalida.remoteURL = @"/static/iphone/yalida.zip";
    feeling_yalida.localPath = dir;
    feeling_yalida.isDefault = [NSNumber numberWithInt:1];
    feeling_yalida.isAvailable = [NSNumber numberWithInt:0];  //1
    feeling_yalida.mark = mark;
    
    [self insertPetData:feeling_yalida];
    //feeling--
    
    //magic++
    CPDBModelPetData *magic_qiaoqiaoni = [[CPDBModelPetData alloc] init];
    magic_qiaoqiaoni.dataID = @"qiaoqiaoni";
    magic_qiaoqiaoni.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_qiaoqiaoni.dataSize = [NSNumber numberWithInt:2560];
    magic_qiaoqiaoni.petID = petLocalId;
    magic_qiaoqiaoni.petResID = petResID;
    magic_qiaoqiaoni.name = @"在干嘛";
    magic_qiaoqiaoni.thumb = [NSString stringWithFormat:@"%@/qiaoqiaoni_QP@2x.gif", dir];
    magic_qiaoqiaoni.remoteURL = @"/static/iphone/qiaoqiaoni.zip";
    magic_qiaoqiaoni.localPath = dir;
    magic_qiaoqiaoni.isDefault = [NSNumber numberWithInt:1];
    magic_qiaoqiaoni.isAvailable = [NSNumber numberWithInt:0];
    magic_qiaoqiaoni.mark = mark;
    
    [self insertPetData:magic_qiaoqiaoni];
    
    CPDBModelPetData *magic_baobao = [[CPDBModelPetData alloc] init];
    magic_baobao.dataID = @"baobao";
    magic_baobao.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_baobao.dataSize = [NSNumber numberWithInt:791];
    magic_baobao.petID = petLocalId;
    magic_baobao.petResID = petResID;
    magic_baobao.name = @"抱抱";
    magic_baobao.thumb = [NSString stringWithFormat:@"%@/baobao_QP@2x.gif", dir];
    magic_baobao.remoteURL = @"/static/iphone/baobao.zip";
    magic_baobao.localPath = dir;
    magic_baobao.isDefault = [NSNumber numberWithInt:1];
    magic_baobao.isAvailable = [NSNumber numberWithInt:0];
    magic_baobao.mark = mark;
    
    [self insertPetData:magic_baobao];
    
    CPDBModelPetData *magic_xianyinqin = [[CPDBModelPetData alloc] init];
    magic_xianyinqin.dataID = @"xianyinqin";
    magic_xianyinqin.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_xianyinqin.dataSize = [NSNumber numberWithInt:1126];
    magic_xianyinqin.petID = petLocalId;
    magic_xianyinqin.petResID = petResID;
    magic_xianyinqin.name = @"献殷勤";
    magic_xianyinqin.thumb = [NSString stringWithFormat:@"%@/xianyinqin_QP@2x.gif", dir];
    magic_xianyinqin.remoteURL = @"/static/iphone/xianyinqin.zip";
    magic_xianyinqin.localPath = dir;
    magic_xianyinqin.isDefault = [NSNumber numberWithInt:1];
    magic_xianyinqin.isAvailable = [NSNumber numberWithInt:0];
    magic_xianyinqin.mark = mark;
    
    [self insertPetData:magic_xianyinqin];
    
    CPDBModelPetData *magic_anweini = [[CPDBModelPetData alloc] init];
    magic_anweini.dataID = @"anweini";
    magic_anweini.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_anweini.dataSize = [NSNumber numberWithInt:1331];
    magic_anweini.petID = petLocalId;
    magic_anweini.petResID = petResID;
    magic_anweini.name = @"安慰你";
    magic_anweini.thumb = [NSString stringWithFormat:@"%@/anweini_QP@2x.gif", dir];
    magic_anweini.remoteURL = @"/static/iphone/anweini.zip";
    magic_anweini.localPath = dir;
    magic_anweini.isDefault = [NSNumber numberWithInt:1];
    magic_anweini.isAvailable = [NSNumber numberWithInt:0];
    magic_anweini.mark = mark;
    
    [self insertPetData:magic_anweini];
    
    CPDBModelPetData *magic_tiaodou = [[CPDBModelPetData alloc] init];
    magic_tiaodou.dataID = @"tiaodou";
    magic_tiaodou.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_tiaodou.dataSize = [NSNumber numberWithInt:1126];
    magic_tiaodou.petID = petLocalId;
    magic_tiaodou.petResID = petResID;
    magic_tiaodou.name = @"挑逗";
    magic_tiaodou.thumb = [NSString stringWithFormat:@"%@/tiaodou_QP@2x.gif", dir];
    magic_tiaodou.remoteURL = @"/static/iphone/tiaodou.zip";
    magic_tiaodou.localPath = dir;
    magic_tiaodou.isDefault = [NSNumber numberWithInt:1];
    magic_tiaodou.isAvailable = [NSNumber numberWithInt:0];
    magic_tiaodou.mark = mark;
    
    [self insertPetData:magic_tiaodou];
    
    CPDBModelPetData *magic_jiaban = [[CPDBModelPetData alloc] init];
    magic_jiaban.dataID = @"jiaban";
    magic_jiaban.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_jiaban.dataSize = [NSNumber numberWithInt:2048];
    magic_jiaban.petID = petLocalId;
    magic_jiaban.petResID = petResID;
    magic_jiaban.name = @"加班";
    magic_jiaban.thumb = [NSString stringWithFormat:@"%@/jiaban_QP@2x.gif", dir];
    magic_jiaban.remoteURL = @"/static/iphone/jiaban.zip";
    magic_jiaban.localPath = dir;
    magic_jiaban.isDefault = [NSNumber numberWithInt:1];
    magic_jiaban.isAvailable = [NSNumber numberWithInt:0];
    magic_jiaban.mark = mark;
    
    [self insertPetData:magic_jiaban];
    
    CPDBModelPetData *magic_psdh = [[CPDBModelPetData alloc] init];
    magic_psdh.dataID = @"psdh";
    magic_psdh.dataType = [NSNumber numberWithInt:3];//@"magic";
    magic_psdh.dataSize = [NSNumber numberWithInt:1536];
    magic_psdh.petID = petLocalId;
    magic_psdh.petResID = petResID;
    magic_psdh.name = @"排山倒海掌";
    magic_psdh.thumb = [NSString stringWithFormat:@"%@/psdh_QP@2x.gif", dir];
    magic_psdh.remoteURL = @"/static/iphone/psdh.zip";
    magic_psdh.localPath = dir;
    magic_psdh.isDefault = [NSNumber numberWithInt:1];
    magic_psdh.isAvailable = [NSNumber numberWithInt:1];
    magic_psdh.mark = mark;
    
    [self insertPetData:magic_psdh];
    //magic--
    
//smallanim++
    //1.
    CPDBModelPetData *smallanim_baibai = [[CPDBModelPetData alloc] init];
    smallanim_baibai.dataID = @"baibai";
    smallanim_baibai.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_baibai.petID = petLocalId;
    smallanim_baibai.petResID = petResID;
    smallanim_baibai.name = @"拜拜";
    smallanim_baibai.thumb = [NSString stringWithFormat:@"%@/baibai01.gif", dir];
    smallanim_baibai.remoteURL = @"";
    smallanim_baibai.localPath = dir;
    smallanim_baibai.isDefault = [NSNumber numberWithInt:1];
    smallanim_baibai.isAvailable = [NSNumber numberWithInt:1];
    smallanim_baibai.mark = mark;
    
    [self insertPetData:smallanim_baibai];
    
    //2.
    CPDBModelPetData *smallanim_bishi = [[CPDBModelPetData alloc] init];
    smallanim_bishi.dataID = @"bishi";
    smallanim_bishi.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_bishi.petID = petLocalId;
    smallanim_bishi.petResID = petResID;
    smallanim_bishi.name = @"鄙视";
    smallanim_bishi.thumb = [NSString stringWithFormat:@"%@/bishi01.gif", dir];
    smallanim_bishi.remoteURL = @"";
    smallanim_bishi.localPath = dir;
    smallanim_bishi.isDefault = [NSNumber numberWithInt:1];
    smallanim_bishi.isAvailable = [NSNumber numberWithInt:1];
    smallanim_bishi.mark = mark;
    
    [self insertPetData:smallanim_bishi];
    
    //3.
    CPDBModelPetData *smallanim_bizui = [[CPDBModelPetData alloc] init];
    smallanim_bizui.dataID = @"bizui";
    smallanim_bizui.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_bizui.petID = petLocalId;
    smallanim_bizui.petResID = petResID;
    smallanim_bizui.name = @"闭嘴";
    smallanim_bizui.thumb = [NSString stringWithFormat:@"%@/bizui01.gif", dir];
    smallanim_bizui.remoteURL = @"";
    smallanim_bizui.localPath = dir;
    smallanim_bizui.isDefault = [NSNumber numberWithInt:1];
    smallanim_bizui.isAvailable = [NSNumber numberWithInt:1];
    smallanim_bizui.mark = mark;
    
    [self insertPetData:smallanim_bizui];
    
    //4.
    CPDBModelPetData *smallanim_daku = [[CPDBModelPetData alloc] init];
    smallanim_daku.dataID = @"daku";
    smallanim_daku.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_daku.petID = petLocalId;
    smallanim_daku.petResID = petResID;
    smallanim_daku.name = @"大哭";
    smallanim_daku.thumb = [NSString stringWithFormat:@"%@/daku01.gif", dir];
    smallanim_daku.remoteURL = @"";
    smallanim_daku.localPath = dir;
    smallanim_daku.isDefault = [NSNumber numberWithInt:1];
    smallanim_daku.isAvailable = [NSNumber numberWithInt:1];
    smallanim_daku.mark = mark;
    
    [self insertPetData:smallanim_daku];
    
    //5.
    CPDBModelPetData *smallanim_fennu = [[CPDBModelPetData alloc] init];
    smallanim_fennu.dataID = @"fennu";
    smallanim_fennu.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_fennu.petID = petLocalId;
    smallanim_fennu.petResID = petResID;
    smallanim_fennu.name = @"愤怒";
    smallanim_fennu.thumb = [NSString stringWithFormat:@"%@/fennu01.gif", dir];
    smallanim_fennu.remoteURL = @"";
    smallanim_fennu.localPath = dir;
    smallanim_fennu.isDefault = [NSNumber numberWithInt:1];
    smallanim_fennu.isAvailable = [NSNumber numberWithInt:1];
    smallanim_fennu.mark = mark;
    
    [self insertPetData:smallanim_fennu];
    
    //6.
    CPDBModelPetData *smallanim_haixiu = [[CPDBModelPetData alloc] init];
    smallanim_haixiu.dataID = @"haixiu";
    smallanim_haixiu.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_haixiu.petID = petLocalId;
    smallanim_haixiu.petResID = petResID;
    smallanim_haixiu.name = @"害羞";
    smallanim_haixiu.thumb = [NSString stringWithFormat:@"%@/haixiu01.gif", dir];
    smallanim_haixiu.remoteURL = @"";
    smallanim_haixiu.localPath = dir;
    smallanim_haixiu.isDefault = [NSNumber numberWithInt:1];
    smallanim_haixiu.isAvailable = [NSNumber numberWithInt:1];
    smallanim_haixiu.mark = mark;
    
    [self insertPetData:smallanim_haixiu];
    
    //7.
    CPDBModelPetData *smallanim_han = [[CPDBModelPetData alloc] init];
    smallanim_han.dataID = @"han";
    smallanim_han.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_han.petID = petLocalId;
    smallanim_han.petResID = petResID;
    smallanim_han.name = @"汗";
    smallanim_han.thumb = [NSString stringWithFormat:@"%@/han01.gif", dir];
    smallanim_han.remoteURL = @"";
    smallanim_han.localPath = dir;
    smallanim_han.isDefault = [NSNumber numberWithInt:1];
    smallanim_han.isAvailable = [NSNumber numberWithInt:1];
    smallanim_han.mark = mark;
    
    [self insertPetData:smallanim_han];
    
    //8.
    CPDBModelPetData *smallanim_heng = [[CPDBModelPetData alloc] init];
    smallanim_heng.dataID = @"heng";
    smallanim_heng.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_heng.petID = petLocalId;
    smallanim_heng.petResID = petResID;
    smallanim_heng.name = @"哼";
    smallanim_heng.thumb = [NSString stringWithFormat:@"%@/heng01.gif", dir];
    smallanim_heng.remoteURL = @"";
    smallanim_heng.localPath = dir;
    smallanim_heng.isDefault = [NSNumber numberWithInt:1];
    smallanim_heng.isAvailable = [NSNumber numberWithInt:1];
    smallanim_heng.mark = mark;
    
    [self insertPetData:smallanim_heng];
    
    //9.
    CPDBModelPetData *smallanim_huaixiao = [[CPDBModelPetData alloc] init];
    smallanim_huaixiao.dataID = @"huaixiao";
    smallanim_huaixiao.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_huaixiao.petID = petLocalId;
    smallanim_huaixiao.petResID = petResID;
    smallanim_huaixiao.name = @"坏笑";
    smallanim_huaixiao.thumb = [NSString stringWithFormat:@"%@/huaixiao01.gif", dir];
    smallanim_huaixiao.remoteURL = @"";
    smallanim_huaixiao.localPath = dir;
    smallanim_huaixiao.isDefault = [NSNumber numberWithInt:1];
    smallanim_huaixiao.isAvailable = [NSNumber numberWithInt:1];
    smallanim_huaixiao.mark = mark;
    
    [self insertPetData:smallanim_huaixiao];
    
    //10.
    CPDBModelPetData *smallanim_jingya = [[CPDBModelPetData alloc] init];
    smallanim_jingya.dataID = @"jingya";
    smallanim_jingya.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_jingya.petID = petLocalId;
    smallanim_jingya.petResID = petResID;
    smallanim_jingya.name = @"惊讶";
    smallanim_jingya.thumb = [NSString stringWithFormat:@"%@/jingya01.gif", dir];
    smallanim_jingya.remoteURL = @"";
    smallanim_jingya.localPath = dir;
    smallanim_jingya.isDefault = [NSNumber numberWithInt:1];
    smallanim_jingya.isAvailable = [NSNumber numberWithInt:1];
    smallanim_jingya.mark = mark;
    
    [self insertPetData:smallanim_jingya];

    //11.
    CPDBModelPetData *smallanim_kunle = [[CPDBModelPetData alloc] init];
    smallanim_kunle.dataID = @"kunle";
    smallanim_kunle.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_kunle.petID = petLocalId;
    smallanim_kunle.petResID = petResID;
    smallanim_kunle.name = @"困了";
    smallanim_kunle.thumb = [NSString stringWithFormat:@"%@/kunle01.gif", dir];
    smallanim_kunle.remoteURL = @"";
    smallanim_kunle.localPath = dir;
    smallanim_kunle.isDefault = [NSNumber numberWithInt:1];
    smallanim_kunle.isAvailable = [NSNumber numberWithInt:1];
    smallanim_kunle.mark = mark;
    
    [self insertPetData:smallanim_kunle];
    
    //12.
    CPDBModelPetData *smallanim_beida = [[CPDBModelPetData alloc] init];
    smallanim_beida.dataID = @"beida";
    smallanim_beida.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_beida.petID = petLocalId;
    smallanim_beida.petResID = petResID;
    smallanim_beida.name = @"被打";
    smallanim_beida.thumb = [NSString stringWithFormat:@"%@/beida03.gif", dir];
    smallanim_beida.remoteURL = @"";
    smallanim_beida.localPath = dir;
    smallanim_beida.isDefault = [NSNumber numberWithInt:1];
    smallanim_beida.isAvailable = [NSNumber numberWithInt:1];
    smallanim_beida.mark = mark;
    
    [self insertPetData:smallanim_beida];
    
    //13.
    CPDBModelPetData *smallanim_se = [[CPDBModelPetData alloc] init];
    smallanim_se.dataID = @"se";
    smallanim_se.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_se.petID = petLocalId;
    smallanim_se.petResID = petResID;
    smallanim_se.name = @"色";
    smallanim_se.thumb = [NSString stringWithFormat:@"%@/se01.gif", dir];
    smallanim_se.remoteURL = @"";
    smallanim_se.localPath = dir;
    smallanim_se.isDefault = [NSNumber numberWithInt:1];
    smallanim_se.isAvailable = [NSNumber numberWithInt:1];
    smallanim_se.mark = mark;
    
    [self insertPetData:smallanim_se];
    
    //14.
    CPDBModelPetData *smallanim_taiweiqu = [[CPDBModelPetData alloc] init];
    smallanim_taiweiqu.dataID = @"taiweiqu";
    smallanim_taiweiqu.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_taiweiqu.petID = petLocalId;
    smallanim_taiweiqu.petResID = petResID;
    smallanim_taiweiqu.name = @"太委屈";
    smallanim_taiweiqu.thumb = [NSString stringWithFormat:@"%@/taiweiqu01.gif", dir];
    smallanim_taiweiqu.remoteURL = @"";
    smallanim_taiweiqu.localPath = dir;
    smallanim_taiweiqu.isDefault = [NSNumber numberWithInt:1];
    smallanim_taiweiqu.isAvailable = [NSNumber numberWithInt:1];
    smallanim_taiweiqu.mark = mark;
    
    [self insertPetData:smallanim_taiweiqu];
    
    //15.
    CPDBModelPetData *smallanim_touxiao = [[CPDBModelPetData alloc] init];
    smallanim_touxiao.dataID = @"touxiao";
    smallanim_touxiao.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_touxiao.petID = petLocalId;
    smallanim_touxiao.petResID = petResID;
    smallanim_touxiao.name = @"偷笑";
    smallanim_touxiao.thumb = [NSString stringWithFormat:@"%@/touxiao01.gif", dir];
    smallanim_touxiao.remoteURL = @"";
    smallanim_touxiao.localPath = dir;
    smallanim_touxiao.isDefault = [NSNumber numberWithInt:1];
    smallanim_touxiao.isAvailable = [NSNumber numberWithInt:1];
    smallanim_touxiao.mark = mark;
    
    [self insertPetData:smallanim_touxiao];
    
    //16.
    CPDBModelPetData *smallanim_tu = [[CPDBModelPetData alloc] init];
    smallanim_tu.dataID = @"tu";
    smallanim_tu.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_tu.petID = petLocalId;
    smallanim_tu.petResID = petResID;
    smallanim_tu.name = @"吐";
    smallanim_tu.thumb = [NSString stringWithFormat:@"%@/tu01.gif", dir];
    smallanim_tu.remoteURL = @"";
    smallanim_tu.localPath = dir;
    smallanim_tu.isDefault = [NSNumber numberWithInt:1];
    smallanim_tu.isAvailable = [NSNumber numberWithInt:1];
    smallanim_tu.mark = mark;
    
    [self insertPetData:smallanim_tu];
    
    //17.
    CPDBModelPetData *smallanim_xiaohaha = [[CPDBModelPetData alloc] init];
    smallanim_xiaohaha.dataID = @"xiaohaha";
    smallanim_xiaohaha.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_xiaohaha.petID = petLocalId;
    smallanim_xiaohaha.petResID = petResID;
    smallanim_xiaohaha.name = @"笑哈哈";
    smallanim_xiaohaha.thumb = [NSString stringWithFormat:@"%@/xiaohua01.gif", dir];
    smallanim_xiaohaha.remoteURL = @"";
    smallanim_xiaohaha.localPath = dir;
    smallanim_xiaohaha.isDefault = [NSNumber numberWithInt:1];
    smallanim_xiaohaha.isAvailable = [NSNumber numberWithInt:1];
    smallanim_xiaohaha.mark = mark;
    
    [self insertPetData:smallanim_xiaohaha];
    
    //18.
    CPDBModelPetData *smallanim_zhuakuang = [[CPDBModelPetData alloc] init];
    smallanim_zhuakuang.dataID = @"zhuakuang";
    smallanim_zhuakuang.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_zhuakuang.petID = petLocalId;
    smallanim_zhuakuang.petResID = petResID;
    smallanim_zhuakuang.name = @"抓狂";
    smallanim_zhuakuang.thumb = [NSString stringWithFormat:@"%@/zhuakuang01.gif", dir];
    smallanim_zhuakuang.remoteURL = @"";
    smallanim_zhuakuang.localPath = dir;
    smallanim_zhuakuang.isDefault = [NSNumber numberWithInt:1];
    smallanim_zhuakuang.isAvailable = [NSNumber numberWithInt:1];
    smallanim_zhuakuang.mark = mark;
    
    [self insertPetData:smallanim_zhuakuang];
    
    //19.
    CPDBModelPetData *smallanim_zhuangku = [[CPDBModelPetData alloc] init];
    smallanim_zhuangku.dataID = @"zhuangku";
    smallanim_zhuangku.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_zhuangku.petID = petLocalId;
    smallanim_zhuangku.petResID = petResID;
    smallanim_zhuangku.name = @"装酷";
    smallanim_zhuangku.thumb = [NSString stringWithFormat:@"%@/zhuangku01.gif", dir];
    smallanim_zhuangku.remoteURL = @"";
    smallanim_zhuangku.localPath = dir;
    smallanim_zhuangku.isDefault = [NSNumber numberWithInt:1];
    smallanim_zhuangku.isAvailable = [NSNumber numberWithInt:1];
    smallanim_zhuangku.mark = mark;
    
    [self insertPetData:smallanim_zhuangku];
    
    //20.
    CPDBModelPetData *smallanim_zuoguilian = [[CPDBModelPetData alloc] init];
    smallanim_zuoguilian.dataID = @"zuoguilian";
    smallanim_zuoguilian.dataType = [NSNumber numberWithInt:4];//@"smallanim";
    smallanim_zuoguilian.petID = petLocalId;
    smallanim_zuoguilian.petResID = petResID;
    smallanim_zuoguilian.name = @"做鬼脸";
    smallanim_zuoguilian.thumb = [NSString stringWithFormat:@"%@/zuoguilian01.gif", dir];
    smallanim_zuoguilian.remoteURL = @"";
    smallanim_zuoguilian.localPath = dir;
    smallanim_zuoguilian.isDefault = [NSNumber numberWithInt:1];
    smallanim_zuoguilian.isAvailable = [NSNumber numberWithInt:1];
    smallanim_zuoguilian.mark = mark;
    
    [self insertPetData:smallanim_zuoguilian];
    
//smallanim--


    //init default pet data--
    
    [db commit];
}

- (id)initWithStatusCode:(NSInteger)statusCode
{
    self = [super init];
    if(self)
    {
        if (statusCode == 1)
        {
            [self createPetInfoTable];
            [self initDefautlData];
            
            if (nil==[[NSUserDefaults standardUserDefaults] objectForKey:@"pet_update_0_7_1"]) {
                [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"pet_update_0_7_1"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
        
        }else{
            
            if (nil==[[NSUserDefaults standardUserDefaults] objectForKey:@"pet_update_0_7_1"]) {
                [db executeUpdate:@"DROP TABLE pet_info_table"];
                [db executeUpdate:@"DROP TABLE pet_data_table"];
                [self createPetInfoTable];
                [self initDefautlData];
                
                [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"pet_update_0_7_1"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
        }
    }
    return self;
}

-(void)createPetInfoTable
{
    

    ///////////////////////////////////
    [db executeUpdate:@"CREATE TABLE pet_info_table (id INTEGER PRIMARY KEY AUTOINCREMENT,  \
                                                        pet_id TEXT,                        \
                                                        pet_name TEXT,                      \
                                                        is_default INTEGER,                 \
                                                        local_path TEXT,                    \
                                                        remote_url TEXT,                    \
                                                        mark INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    
    [db executeUpdate:@"CREATE TABLE pet_data_table (id INTEGER PRIMARY KEY AUTOINCREMENT,  \
                                                        data_id TEXT,                       \
                                                        data_type INTEGER,                  \
                                                        data_size INTEGER,                  \
                                                        category INTEGER,                   \
                                                        pet_local_id INTEGER,               \
                                                        pet_resource_id TEXT,               \
                                                        name TEXT,                          \
                                                        thumb TEXT,                         \
                                                        remote_url TEXT,                    \
                                                        local_path TEXT,                    \
                                                        is_default INTEGER,                 \
                                                        is_available INTEGER,               \
                                                        mark INTEGER)"];
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}

-(NSNumber *)insertPetInfo:(CPDBModelPetInfo *)dbPetInfo
{
    [db executeUpdate:@"insert into pet_info_table ( pet_id,        \
                                                     pet_name,      \
                                                     is_default,    \
                                                     local_path,    \
                                                     remote_url,    \
                                                     mark)          \
                                            values (?, ?, ?, ?, ?, ?)",
                                                     dbPetInfo.petID,
                                                     dbPetInfo.petName,
                                                     dbPetInfo.isDefault,
                                                     dbPetInfo.localPath,
                                                     dbPetInfo.remoteURL,
                                                     dbPetInfo.mark];
    
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    
    return [self lastRowID];
}

- (NSNumber *)insertPetData:(CPDBModelPetData *)dbPetData
{
    [db executeUpdate:@"insert into pet_data_table ( data_id,           \
                                                     data_type,         \
                                                     data_size,         \
                                                     category,          \
                                                     pet_local_id,      \
                                                     pet_resource_id,   \
                                                     name,              \
                                                     thumb,             \
                                                     remote_url,        \
                                                     local_path,        \
                                                     is_default,        \
                                                     is_available,      \
                                                     mark)              \
                                            values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                                                     dbPetData.dataID,
                                                     dbPetData.dataType,
                                                     dbPetData.dataSize,
                                                     dbPetData.category,
                                                     dbPetData.petID,
                                                     dbPetData.petResID,
                                                     dbPetData.name,
                                                     dbPetData.thumb,
                                                     dbPetData.remoteURL,
                                                     dbPetData.localPath,
                                                     dbPetData.isDefault,
                                                     dbPetData.isAvailable,
                                                     dbPetData.mark];
    
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    
    return [self lastRowID];
}

- (void)updatePetInfoWithID:(NSNumber *)objID obj:(CPDBModelPetInfo *)dbPetInfo
{
    [db executeUpdate:@"update pet_info_table set pet_id=?,         \
                                                  pet_name=?,       \
                                                  is_default=?,     \
                                                  local_path=?,     \
                                                  remote_url=?,     \
                                                  mark=?            \
                                            where id =?",
                                                  dbPetInfo.petID,
                                                  dbPetInfo.petName,
                                                  dbPetInfo.isDefault,
                                                  dbPetInfo.localPath,
                                                  dbPetInfo.remoteURL,
                                                  dbPetInfo.mark,
                                                  objID];
    
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}

- (void)updatePetDataWithID:(NSNumber *)objID obj:(CPDBModelPetData *)dbPetData
{
    [db executeUpdate:@"update pet_data_table set data_id=?,            \
                                                  data_type=?,          \
                                                  data_size=?,          \
                                                  category=?,           \
                                                  pet_local_id=?,       \
                                                  pet_resource_id=?,    \
                                                  name=?,               \
                                                  thumb=?,              \
                                                  remote_url=?,         \
                                                  local_path=?,         \
                                                  is_default=?,         \
                                                  is_available=?,       \
                                                  mark=?                \
                                            where id =?",
                                                  dbPetData.dataID,
                                                  dbPetData.dataType,
                                                  dbPetData.dataSize,
                                                  dbPetData.category,
                                                  dbPetData.petID,
                                                  dbPetData.petResID,
                                                  dbPetData.name,
                                                  dbPetData.thumb,
                                                  dbPetData.remoteURL,
                                                  dbPetData.localPath,
                                                  dbPetData.isDefault,
                                                  dbPetData.isAvailable,
                                                  dbPetData.mark,
                                                  objID];
    
    if ([db hadError])
    {
        CPLogError(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}

- (CPDBModelPetInfo *)getPetInfoWithResultSet:(FMResultSet *)rs
{
    CPDBModelPetInfo *petInfo = [[CPDBModelPetInfo alloc] init];
    
    petInfo.localID = [NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]];
    petInfo.petID = [rs stringForColumn:@"pet_id"];
    petInfo.petName = [rs stringForColumn:@"pet_name"];
    petInfo.isDefault = [NSNumber numberWithInt:[rs intForColumn:@"is_default"]];
    petInfo.localPath = [rs stringForColumn:@"local_path"];
    petInfo.remoteURL = [rs stringForColumn:@"remote_url"];
    petInfo.mark = [NSNumber numberWithInt:[rs intForColumn:@"mark"]];
    
    return petInfo;
}

- (CPDBModelPetData *)getPetDataWithResultSet:(FMResultSet *)rs
{
    CPDBModelPetData *petData = [[CPDBModelPetData alloc] init];
    
    petData.localID = [NSNumber numberWithLongLong:[rs longLongIntForColumn:@"id"]];
    petData.dataID = [rs stringForColumn:@"data_id"];
    petData.dataType = [NSNumber numberWithLongLong:[rs intForColumn:@"data_type"]];
    petData.dataSize = [NSNumber numberWithLongLong:[rs intForColumn:@"data_size"]];
    petData.category = [NSNumber numberWithLongLong:[rs intForColumn:@"category"]];
    petData.petID = [NSNumber numberWithLongLong:[rs longLongIntForColumn:@"pet_local_id"]];
    petData.petResID = [rs stringForColumn:@"pet_resource_id"];
    petData.name = [rs stringForColumn:@"name"];
    petData.thumb = [rs stringForColumn:@"thumb"];
    petData.remoteURL = [rs stringForColumn:@"remote_url"];
    petData.localPath = [rs stringForColumn:@"local_path"];
    petData.isDefault = [NSNumber numberWithInt:[rs intForColumn:@"is_default"]];
    petData.isAvailable = [NSNumber numberWithInt:[rs intForColumn:@"is_available"]];
    petData.mark = [NSNumber numberWithInt:[rs intForColumn:@"mark"]];
    
    return petData;
}

- (CPDBModelPetInfo *)findPetInfoWithID:(NSNumber *)id
{
    CPDBModelPetInfo *petInfo = nil;
    
    if(id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from pet_info_table where id = ?", id];
        
        if([rs next])
        {
            petInfo = [self getPetInfoWithResultSet:rs];
        }
        
        [rs close];
    }
    
    return petInfo;
}

- (CPDBModelPetData *)findPetDataWithID:(NSNumber *)id
{
    CPDBModelPetData *petData = nil;
    
    if(id)
    {
        FMResultSet *rs = [db executeQuery:@"select * from pet_data_table where id = ?", id];
        
        if([rs next])
        {
            petData = [self getPetDataWithResultSet:rs];
        }
        
        [rs close];
    }
    
    return petData;
}

- (NSArray *)findAllPetInfo
{
    FMResultSet *rs = [db executeQuery:@"select * from pet_info_table"];
    NSMutableArray *petInfoList = [[NSMutableArray alloc] init];
    
    while ([rs next])
    {
        [petInfoList addObject:[self getPetInfoWithResultSet:rs]];
    }
    
    [rs close];
    
    return petInfoList;
}

- (NSArray *)findAllPetData
{
    FMResultSet *rs = [db executeQuery:@"select * from pet_data_table"];
    NSMutableArray *petDataList = [[NSMutableArray alloc] init];
    
    while ([rs next])
    {
        [petDataList addObject:[self getPetDataWithResultSet:rs]];
    }
    
    [rs close];
    
    return petDataList;
}

@end
