//
//  UtilsMacro.h
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

#define __UIView(name)       @property (strong,nonatomic) UIView       *name
#define __UILabel(name)      @property (strong,nonatomic) UILabel      *name
#define __UIImage(name)      @property (strong,nonatomic) UIImage      *name
#define __UIButton(name)     @property (strong,nonatomic) UIButton     *name
#define __UIWebView(name)    @property (strong,nonatomic) UIWebView    *name
#define __UITextField(name)  @property (strong,nonatomic) UITextField  *name
#define __UITableView(name)  @property (strong,nonatomic) UITableView  *name
#define __UIImageView(name)  @property (strong,nonatomic) UIImageView  *name
#define __UIScrollView(name) @property (strong,nonatomic) UIScrollView *name

#define __CGFloat(name)             @property (assign,nonatomic) CGFloat              name
#define __NSString(name)            @property (copy  ,nonatomic) NSString            *name
#define __NSArray(name)             @property (strong,nonatomic) NSArray             *name
#define __NSMutableArray(name)      @property (copy  ,nonatomic) NSMutableArray      *name
#define __NSDictionary(name)        @property (strong,nonatomic) NSDictionary        *name
#define __NSMutableDictionary(name) @property (strong,nonatomic) NSMutableDictionary *name


#endif /* UtilsMacro_h */
