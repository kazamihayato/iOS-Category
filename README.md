# iOS 常用Category类别分享（持续更新）

以后会持续更新，可以继续关注哦！

# 前言
各位都知道，类别是一种为现有的类添加新方法的方式，利用Objective-C的动态运行时分配机制，可以为现有的类添加新方法，这种为现有的类添加新方法的方式称为类别catagory，他可以为任何类添加新的方法，包括那些没有源代码的类。类别使得无需创建对象类的子类就能完成同样的工作。
   有许多小技术点靠类别直接实现，从而节约时间将精力花在更重要的开发任务上，现在我来分享一下我从事iOS开发以来积累的Category！<br>
   **PS:我会不定期进行更新，加入一些新的方法；**<br>
   <br>
   ------<br>
   ##17.8.25更新<br>
   1.进行了局部的重新排版；<br>
   2.添加了NSObject的一些分类方法（具体见下面内容）；<br>
   3.合并了一些类目方法；<br>
   4.整理了整个项目文件夹，条目更加清晰；<br>
   5.添加了更多的注释；<br>
   <br>
   <br>
   ------<br>
   这边我给大家分享的基本都是常用类，其中包括**NSObject**、 **NSString**、 **NSArray**、**NSDictionary**、**UIView**、**UIImage**、**UIButton**、**UIView**、**UIView**、**NSData**、**UIMenuItem**。<br>
   <br>
   以下一个个来进行概要说明：<br>
   <br>
   ### NSString && NSAttributedString<br>
   **NSString** 部分包括：<br>
   1.一些在项目中常用的方法<br>
   ```
   //电话号码中间4位*显示
   + (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;

   //银行卡号中间8位*显示<br>
   + (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo;<br>
   <br>
   //转为手机格式，默认为-<br>
   + (NSString*) stringMobileFormat:(NSString*)mobile;<br>
   <br>
   //金额数字添加单位（暂时写了万和亿，有更多的需求请参考写法来自行添加）<br>
   + (NSString*) stringChineseFormat:(double)value;<br>
   <br>
   //添加数字的千位符<br>
   + (NSString*) countNumAndChangeformat:(NSString *)num;<br>
   <br>
   // NSString转为NSNumber<br>
   - (NSNumber*) toNumber;<br>
   <br>
   //计算文字高度<br>
   - (CGFloat  ) heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;<br>
   <br>
   //计算文字宽度<br>
   - (CGFloat  ) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight;<br>
   <br>
   //抹除小数末尾的0<br>
   - (NSString*) removeUnwantedZero;<br>
   <br>
   //去掉前后空格<br>
   - (NSString*) trimmedString;<br>
   ```<br>
   2.常用的正则表达式判断<br>
   ```<br>
   //有效的电话号码<br>
   - (BOOL) isValidMobileNumber;<br>
   <br>
   //有效的真实姓名<br>
   - (BOOL) isValidRealName;<br>
   <br>
   //是否只有中文<br>
   - (BOOL) isOnlyChinese;<br>
   <br>
   //有效的验证码(根据自家的验证码位数进行修改)<br>
   - (BOOL) isValidVerifyCode;<br>
   <br>
   //有效的银行卡号<br>
   - (BOOL) isValidBankCardNumber;<br>
   <br>
   //有效的邮箱<br>
   - (BOOL) isValidEmail;<br>
   <br>
   //有效的字母数字密码<br>
   - (BOOL) isValidAlphaNumberPassword;<br>
   <br>
   //检测有效身份证<br>
   //15位<br>
   - (BOOL) isValidIdentifyFifteen;<br>
   <br>
   //18位<br>
   - (BOOL) isValidIdentifyEighteen;<br>
   <br>
   //限制只能输入数字<br>
   - (BOOL) isOnlyNumber;<br>
   ```
   3.从时间戳转为显示时间（几小时前等）<br>
   ```
   //通过时间戳计算时间差（几小时前、几天前）<br>
   + (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;<br>
   <br>
   //通过时间戳得出显示时间<br>
   + (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;<br>
   <br>
   //通过时间戳和格式显示时间<br>
   + (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;<br>
   ```<br>
   4.提高NSString && NSMutableString 健壮性的写法（建议各位平时操作NSString及NSMutableString尽量使用，减少闪退）
   **NSString**：
   ```
   - (NSString *)safeSubstringFromIndex:(NSUInteger)from;
   
   - (NSString *)safeSubstringToIndex:(NSUInteger)to;
   
   - (NSString *)safeSubstringWithRange:(NSRange)range;
   
   - (NSRange)safeRangeOfString:(NSString *)aString;
   
   - (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;
   
   - (NSString *)safeStringByAppendingString:(NSString *)aString;
   ```
   **NSMutableString**：
   ```
   - (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;
   
   - (void)safeAppendString:(NSString *)aString;
   
   - (void)safeSetString:(NSString *)aString;
   ```
   **NSAttributedString**部分：
   经过思考后只保留了计算富文本的高度方法，其他需求请用各自的富文本控件完成
   ```
   //由于系统计算富文本的高度不正确，自己写了方法
   - (CGFloat)heightWithContainWidth:(CGFloat)width;
   ```
   
   ###NSArray && NSDictionary
   这两个大类的分类主要是提升健壮性（建议各位平时操作NSString及NSMutableString尽量使用，减少闪退）以及转为json字符串
   
   **NSArray、NSMutableArray**：
   ```
   @interface NSArray (Category)
   //以下写法均防止闪退
   + (instancetype)safeArrayWithObject:(id)object;
   
   - (id)safeObjectAtIndex:(NSUInteger)index;
   
   - (NSArray *)safeSubarrayWithRange:(NSRange)range;
   
   - (NSUInteger)safeIndexOfObject:(id)anObject;
   
   // 数组转成json 字符串
   - (NSString *)toJSONStringForArray;
   @end
   
   @interface NSMutableArray (Category)
   //以下写法均防止闪退
   - (void)safeAddObject:(id)object;
   
   - (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;
   
   - (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;
   
   - (void)safeRemoveObjectAtIndex:(NSUInteger)index;
   
   - (void)safeRemoveObjectsInRange:(NSRange)range;
   @end
   ```
   
   ###NSDictionary、NSMutableDictionary
   ```
   @interface NSDictionary (Category)
   
   //用于数据解析，返回对象为字符串或值类型，数组和字典不要用此方法
   - (id)safeObjectForKey:(NSString *)key;
   
   //设置键值对 针对对象为空处理
   - (void)safeSetObject:(id)object forKey:(id)key;
   - (id)objectForKeyCustom:(id)aKey;
   
   - (id)safeKeyForValue:(id)value;
   
   /**
   *  字段转成json的字符串
   *
   *  @return json 字符串
   */
   - (NSString *)toJSONStringForDictionary;
   @end
   
   @interface NSMutableDictionary (Category)
   - (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;
   
   - (id)safeObjectForKey:(id<NSCopying>)aKey;
   @end
   ```
   ###NSObject
   **NSObject**部分包括：
   1.为当前object动态增加属性
   ```
   @property (nonatomic, strong, readonly) NSMutableArray *associatedObjectNames;
   
   //为当前object动态增加分类
   - (void)objc_setAssociatedObject:(NSString *)propertyName value:(id)value policy:(objc_AssociationPolicy)policy;
   
   //获取当前object某个动态增加的分类
   - (id)objc_getAssociatedObject:(NSString *)propertyName;
   
   //删除动态增加的所有分类
   - (void)objc_removeAssociatedObjects;
   
   //获取对象的所有属性
   - (NSArray *)getProperties;
   ```
   2.dispatch主线程和非主线程的快捷写法
   ```
   // try catch
   + (NSException *)tryCatch:(void(^)())block;
   + (NSException *)tryCatch:(void(^)())block finally:(void(^)())aFinisheBlock;
   
   // 在主线程运行block
   + (void)performInMainThreadBlock:(void(^)())aInMainBlock;
   
   //延时在主线程运行block
   + (void)performInMainThreadBlock:(void(^)())aInMainBlock afterSecond:(NSTimeInterval)delay;
   
   //在非主线程运行block
   + (void)performInThreadBlock:(void(^)())aInThreadBlock;
   
   //延时在非主线程运行block
   + (void)performInThreadBlock:(void(^)())aInThreadBlock afterSecond:(NSTimeInterval)delay;
   ```
   3.Runtime 覆盖方法、交换方法
   ```
   + (BOOL)overrideMethod:(SEL)origSel withMethod:(SEL)altSel;
   
   + (BOOL)overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;
   
   + (BOOL)exchangeMethod:(SEL)origSel withMethod:(SEL)altSel;
   
   + (BOOL)exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;
   ```
   ### UIView && UIImage && UIButton && UIColor
   **UIView**：
   ```
   @interface UIView (Category)
   //把View加在Window上
   - (void) addToWindow;
   @end
   
   @interface UIView (Screenshot)
   //View截图
   - (UIImage*) screenshot;
   
   //ScrollView截图 contentOffset
   - (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;
   
   //View按Rect截图
   - (UIImage*) screenshotInFrame:(CGRect)frame;
   @end
   
   @interface UIView (Animation)
   //左右抖动动画
   - (void) shakeAnimation;
   
   //旋转180度
   - (void) trans180DegreeAnimation;
   @end
   ```
   
   **UIImage**：这里内容很多我只列出一部分，具体的大家可以down或者clone下来之后仔细看
   ```
   //由颜色生成图片
   + (UIImage *) imageWithColor:(UIColor*)color;
   
   //将图片剪裁至目标尺寸
   + (UIImage *) imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;
   
   //图片旋转角度
   - (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;
   
   //拉伸图片UIEdgeInsets
   - (UIImage *) resizableImage:(UIEdgeInsets)insets;
   
   //拉伸图片CGFloat
   - (UIImage *) imageByResizeToScale:(CGFloat)scale;
   
   //放大图片CGSize
   - (UIImage *) imageByResizeWithMaxSize:(CGSize)size;
   
   //小样图图片CGSize
   - (UIImage *) imageWithThumbnailForSize:(CGSize)size;
   
   //通过Rect剪裁图片
   - (UIImage *) imageByCropToRect:(CGRect)rect;
   ```
   
   **UIButton**：非常推荐大家使用扩大点击范围的方法（非常实用）
   ```
   //扩大点击范围，实用性非常强的一个方法，极力推荐
   - (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
   
   //快速添加按钮响应方法，默认为TouchUpInside
   - (void)addCallBackAction:(ButtonActionCallBack)action;
   
   //快速添加按钮响应方法
   - (void)addCallBackAction:(ButtonActionCallBack)action
   forControlEvents:(UIControlEvents)controlEvents;
   ```
   **UIColor**:rgb、二进制、十六进制转换
   ```
   //功能:通过RGB创建颜色
   UIColor *rgb(CGFloat red, CGFloat green, CGFloat blue);
   
   //功能:通过RGB以及alpha创建颜色
   UIColor *rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);
   
   @interface UIColor (Category)
   // Create a color from a HEX string.
   + (UIColor *)hex:(NSString *)hexString;
   
   //通过0xffffff的16进制数字创建颜色
   + (UIColor *)colorWithRGB:(NSUInteger)aRGB;
   
   //调节颜色的明亮度
   + (UIColor*) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;
   
   //调整颜色的透明度
   + (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;
   @end
   ```
   #结语
   这边把一些常用的类别给大家列举了一些，基本每个方法都是我在实际项目因为某些需求写的、还有部分是网上找的。如果不会使用可以来询问我，发现错误请及时联系我，不喜勿喷，谢谢~
   PS:这边就不兼容Pods了，**因为APP在启动的时候会加载所有的分类，全部添加可能会影响启动速度，所以大家可以看了概要之后请选择性的添加**~
   以后我还会持续更新的！最后放出传送门。。麻烦下载的同学给点个星或者点个赞 ，谢谢啦！
[简书地址](http://www.jianshu.com/p/68ba104b9061)
