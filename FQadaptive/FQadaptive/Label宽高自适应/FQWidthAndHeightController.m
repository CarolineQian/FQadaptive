//
//  FQWidthAndHeightController.m
//  FQadaptive
//
//  Created by 冯倩 on 2016/10/26.
//  Copyright © 2016年 冯倩. All rights reserved.



/** 方法
 *  sizeToFits                      UIView
 *  sizeThatFits                    UIView
 *  boundingRectWithSize            NSString
 *  boundingRectWithSize            NSAttributedString
 */

#import "FQWidthAndHeightController.h"

@interface FQWidthAndHeightController ()
{
    UIScrollView  *_scrollView;
    UILabel       *_wToLabel;       //宽sizeToFit
    UILabel       *_hToLabel;       //高sizeToFit
    UILabel       *_wThatLabel;     //宽sizeThatFits
    UILabel       *_hThatLabel;     //高sizeThatFits
    UILabel       *_h5Label;        //Label使用sizeThatFits高度H5适配
    UITextView    *_h5TextView;     //TextView使用sizeThatFits高度H5适配
    
    //NSString的boundingRectWithSize方法计算高度,重绘坐标
    UILabel       *_boundingRectWithSizeLabel;
    //NSAttributedString的boundingRectWithSize方法计算高度,重绘坐标
    UILabel       *_boundingRectWithSizeAttributedLabel;
}

@end

@implementation FQWidthAndHeightController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     *  初始化
     */
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    
    //宽
    _wToLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _wToLabel.backgroundColor = [UIColor lightGrayColor];
    _wToLabel.textAlignment = NSTextAlignmentCenter;
    _wToLabel.font = [UIFont systemFontOfSize:13];
    _wToLabel.numberOfLines = 1;
    [_scrollView addSubview:_wToLabel];
    //高
    _hToLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _hToLabel.backgroundColor = [UIColor lightGrayColor];
    _hToLabel.textAlignment = NSTextAlignmentCenter;
    _hToLabel.font = [UIFont systemFontOfSize:13];
    _hToLabel.numberOfLines = 0;
    [_scrollView addSubview:_hToLabel];
    //宽
    _wThatLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _wThatLabel.backgroundColor = [UIColor lightGrayColor];
    _wThatLabel.textAlignment = NSTextAlignmentCenter;
    _wThatLabel.font = [UIFont systemFontOfSize:13];
    _wThatLabel.numberOfLines = 1;
    [_scrollView addSubview:_wThatLabel];
    //高
    _hThatLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _hThatLabel.backgroundColor = [UIColor lightGrayColor];
    _hThatLabel.textAlignment = NSTextAlignmentCenter;
    _hThatLabel.font = [UIFont systemFontOfSize:13];
    _hThatLabel.numberOfLines = 0;
    [_scrollView addSubview:_hThatLabel];
    //H51
    _h5Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _h5Label.backgroundColor = [UIColor lightGrayColor];
    _h5Label.textAlignment = NSTextAlignmentLeft;
    _h5Label.font = [UIFont systemFontOfSize:13];
    _h5Label.numberOfLines = 0;
    [_scrollView addSubview:_h5Label];
    //H52
    _h5TextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _h5TextView.backgroundColor = [UIColor lightGrayColor];
    _h5TextView.editable =NO;
    _h5TextView.scrollEnabled = NO;
    _h5TextView.dataDetectorTypes = UIDataDetectorTypeLink;
    [_scrollView addSubview:_h5TextView];
    
    //_boundingRectWithSizeLabel
    _boundingRectWithSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _boundingRectWithSizeLabel.backgroundColor = [UIColor lightGrayColor];
    _boundingRectWithSizeLabel.textAlignment = NSTextAlignmentLeft;
    [_scrollView addSubview:_boundingRectWithSizeLabel];
    
    //_boundingRectWithSizeAttributedLabel
    _boundingRectWithSizeAttributedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _boundingRectWithSizeAttributedLabel.backgroundColor = [UIColor lightGrayColor];
    _boundingRectWithSizeAttributedLabel.textAlignment = NSTextAlignmentLeft;
    [_scrollView addSubview:_boundingRectWithSizeAttributedLabel];
    
    
    /**
     *  sizeToFits宽度适配,重绘坐标
     */
    _wToLabel.text = @"[Label]sizeToFits单行宽度自适应";
    [_wToLabel sizeToFit];
    _wToLabel.center = CGPointMake(ScreenWidth / 2, 30 + 15);
    
    /**
     *  sizeToFits高度适配,重绘坐标
     */
    _hToLabel.text = @"[Label]sizeToFits高度自适应\n\n天青色等烟雨\n而我在等你\n炊烟袅袅升起\n隔江千万里\n在瓶底书汉隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨\n而我在等你\n月色被打捞起\n晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n色白花青的锦鲤跃然於碗底\n临摹宋体落款时却惦记着你\n你隐藏在窑烧里千年的秘密\n极细腻犹如绣花针落地\n帘外芭蕉惹骤雨\n门环惹铜绿\n而我路过那江南小镇惹了你\n在泼墨山水画里\n你从墨色深处被隐去";
    [_hToLabel sizeToFit];
    _hToLabel.center = CGPointMake(ScreenWidth / 2, _wToLabel.bottom + 30 + _hToLabel.height / 2);
    
    /**
     *  sizeThatFits宽度适配,重绘坐标
     */
    _wThatLabel.text = @"[Label]sizeThatFits单行宽度自适应";
    CGSize wsizeThat = [_wThatLabel sizeThatFits:CGSizeMake(1000, 1000)];
    _wThatLabel.frame = CGRectMake(_hToLabel.left, _hToLabel.bottom + 30, wsizeThat.width, wsizeThat.height);
    
    /**
     *  sizeThatFits高度适配,重绘坐标
     */
    _hThatLabel.text = @"[Label]sizeThatFits高度自适应\n\n天青色等烟雨\n而我在等你\n炊烟袅袅升起\n隔江千万里\n在瓶底书汉隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨\n而我在等你\n月色被打捞起\n晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n色白花青的锦鲤跃然於碗底\n临摹宋体落款时却惦记着你\n你隐藏在窑烧里千年的秘密\n极细腻犹如绣花针落地\n帘外芭蕉惹骤雨\n门环惹铜绿\n而我路过那江南小镇惹了你\n在泼墨山水画里\n你从墨色深处被隐去";
    CGSize hsizeThat = [_hThatLabel sizeThatFits:CGSizeMake(1000, 1000)];
    _hThatLabel.frame = CGRectMake(_hToLabel.left, _wThatLabel.bottom + 30, hsizeThat.width, hsizeThat.height);
    
    //H5 Label使用sizeThatFits高度H5适配
    NSString *h5LabelString = @"<p>[Label]H5数据使用sizeThatFits进行高度适配:**************天青色等烟雨,而我在等你,炊烟袅袅升起,隔江千万里,在瓶底书汉隶仿前朝的飘逸,就当我为遇见你伏笔,天青色等烟雨,而我在等你,月色被打捞起,晕开了结局,如传世的青花瓷自顾自美丽,你眼带笑意,色白花青的锦鲤跃然於碗底,临摹宋体落款时却惦记着你,你隐藏在窑烧里千年的秘密,极细腻犹如绣花针落地,帘外芭蕉惹骤雨,门环惹铜绿,而我路过那江南小镇惹了你,在泼墨山水画里,你从墨色深处被隐去</p>";
    NSMutableAttributedString  *h5LabelMutableString = [[NSMutableAttributedString alloc] initWithData:[h5LabelString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    _h5Label.attributedText = h5LabelMutableString;
    
    CGSize contentSize = [_h5Label sizeThatFits:CGSizeMake(_scrollView.width - 15 * 2, 10000)];
    _h5Label.frame = CGRectMake(15, _hThatLabel.bottom + 30, _scrollView.width - 30, contentSize.height);
    
    
    
    //H5 TextView使用sizeThatFits高度H5适配
    NSString *h5TextViewString = @"<p>[TextView]H5数据使用sizeThatFits进行高度适配:**************天青色等烟雨,而我在等你,炊烟袅袅升起,隔江千万里,在瓶底书汉隶仿前朝的飘逸,就当我为遇见你伏笔,天青色等烟雨,而我在等你,月色被打捞起,晕开了结局,如传世的青花瓷自顾自美丽,你眼带笑意,色白花青的锦鲤跃然於碗底,临摹宋体落款时却惦记着你,你隐藏在窑烧里千年的秘密,极细腻犹如绣花针落地,帘外芭蕉惹骤雨,门环惹铜绿,而我路过那江南小镇惹了你,在泼墨山水画里,你从墨色深处被隐去</p>";
    NSMutableAttributedString  *h5TextViewMutableString = [[NSMutableAttributedString alloc] initWithData:[h5TextViewString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    _h5TextView.attributedText = h5TextViewMutableString;
    
     CGSize contentSize1 = [_h5TextView sizeThatFits:CGSizeMake(_scrollView.width - 15 * 2, 10000)];
    _h5TextView.frame = CGRectMake(15, _h5Label.bottom + 30, _scrollView.width - 30, contentSize1.height);
    
    
    
    /**
     *  NSString的boundingRectWithSize方法计算高度,重绘坐标
     */
    _boundingRectWithSizeLabel.numberOfLines = 0;
    _boundingRectWithSizeLabel.font = [UIFont systemFontOfSize:14];
    
    NSString *strText = @"今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错";
    _boundingRectWithSizeLabel.text = strText;
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    CGSize size = [strText boundingRectWithSize:CGSizeMake(ScreenWidth - 15 * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    _boundingRectWithSizeLabel.frame = CGRectMake(15, _h5TextView.bottom + 30, size.width, size.height);
    
    
    /**
     *  NSAttributedString的boundingRectWithSize方法计算高度,重绘坐标
     */
    _boundingRectWithSizeAttributedLabel.numberOfLines = 0;
    _boundingRectWithSizeAttributedLabel.font = [UIFont systemFontOfSize:13];
    
    NSString *h5boundingRectWithSizeString = @"<p>天青色等烟雨,而我在等你,炊烟袅袅升起,隔江千万里,在瓶底书汉隶仿前朝的飘逸,就当我为遇见你伏笔,天青色等烟雨,而我在等你,月色被打捞起,晕开了结局,如传世的青花瓷自顾自美丽,你眼带笑意,色白花青的锦鲤跃然於碗底,临摹宋体落款时却惦记着你,你隐藏在窑烧里千年的秘密,极细腻犹如绣花针落地,帘外芭蕉惹骤雨,门环惹铜绿,而我路过那江南小镇惹了你,在泼墨山水画里,你从墨色深处被隐去</p>";
    NSMutableAttributedString *h5boundingRectWithSizeAttributedString = [[NSMutableAttributedString alloc] initWithData:[h5boundingRectWithSizeString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    _boundingRectWithSizeAttributedLabel.attributedText = h5boundingRectWithSizeAttributedString;
    
    CGSize size1 = [h5boundingRectWithSizeAttributedString boundingRectWithSize:CGSizeMake(100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size;
    _boundingRectWithSizeAttributedLabel.frame = CGRectMake(15, _boundingRectWithSizeLabel.bottom + 30, size1.width, size1.height);
    

    
    
    /**
     *  重算scrollView包含坐标
     */
    _scrollView.contentSize = CGSizeMake(0, 30 * 7 + _wToLabel.height + _hToLabel.height + _wThatLabel.height + _hThatLabel.height + _h5Label.height + _h5TextView.height + _boundingRectWithSizeLabel.height + _boundingRectWithSizeAttributedLabel.height);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
