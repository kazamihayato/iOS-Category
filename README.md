# iOS 常用Category类别分享（持续更新）
以后会持续更新，可以继续关注哦！   <br>
[简书地址](http://www.jianshu.com/p/68ba104b9061)   <br>
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
   <br>
   //电话号码中间4位*显示<br>
   + (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;<br>
   <br>
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
<br>
   2.常用的正则表达式判断<br>
   <br>
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
<br>
   3.从时间戳转为显示时间（几小时前等）<br>
<br>
   //通过时间戳计算时间差（几小时前、几天前）<br>
   + (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;<br>
   <br>
   //通过时间戳得出显示时间<br>
   + (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;<br>
   <br>
   //通过时间戳和格式显示时间<br>
   + (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;<br>
   <br>
   4.提高NSString && NSMutableString 健壮性的写法（建议各位平时操作NSString及NSMutableString尽量使用，减少闪退）<br>
   **NSString**：<br>
    <br>
   - (NSString *)safeSubstringFromIndex:(NSUInteger)from;<br>
   <br>
   - (NSString *)safeSubstringToIndex:(NSUInteger)to;<br>
   <br>
   - (NSString *)safeSubstringWithRange:(NSRange)range;<br>
   <br>
   - (NSRange)safeRangeOfString:(NSString *)aString;<br>
   <br>
   - (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;<br>
   <br>
   - (NSString *)safeStringByAppendingString:(NSString *)aString;<br>
   <br>
   **NSMutableString**：<br>
   <br>
   - (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;<br>
   <br>
   - (void)safeAppendString:(NSString *)aString;<br>
   <br>
   - (void)safeSetString:(NSString *)aString;<br>
   <br>
   **NSAttributedString**部分：<br>
   经过思考后只保留了计算富文本的高度方法，其他需求请用各自的富文本控件完成<br>
   <br>
   //由于系统计算富文本的高度不正确，自己写了方法<br>
   - (CGFloat)heightWithContainWidth:(CGFloat)width;<br>
   <br>
   <br>
   ###NSArray && NSDictionary<br>
   这两个大类的分类主要是提升健壮性（建议各位平时操作NSString及NSMutableString尽量使用，减少闪退）以及转为json字符串<br>
   <br>
   **NSArray、NSMutableArray**：<br>
    <br>
   @interface NSArray (Category)<br>
   //以下写法均防止闪退<br>
   + (instancetype)safeArrayWithObject:(id)object;<br>
   <br>
   - (id)safeObjectAtIndex:(NSUInteger)index;<br>
   <br>
   - (NSArray *)safeSubarrayWithRange:(NSRange)range;<br>
   <br>
   - (NSUInteger)safeIndexOfObject:(id)anObject;<br>
   <br>
   // 数组转成json 字符串<br>
   - (NSString *)toJSONStringForArray;<br>
   @end<br>
   <br>
   @interface NSMutableArray (Category)<br>
   //以下写法均防止闪退<br>
   - (void)safeAddObject:(id)object;<br>
   <br>
   - (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;<br>
   <br>
   - (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;<br>
   <br>
   - (void)safeRemoveObjectAtIndex:(NSUInteger)index;<br>
   <br>
   - (void)safeRemoveObjectsInRange:(NSRange)range;<br>
   @end<br>
<br>
   <br>
   ###NSDictionary、NSMutableDictionary<br>
   <br>
   @interface NSDictionary (Category)<br>
   <br>
   //用于数据解析，返回对象为字符串或值类型，数组和字典不要用此方法<br>
   - (id)safeObjectForKey:(NSString *)key;<br>
   <br>
   //设置键值对 针对对象为空处理<br>
   - (void)safeSetObject:(id)object forKey:(id)key;<br>
   - (id)objectForKeyCustom:(id)aKey;<br>
   <br>
   - (id)safeKeyForValue:(id)value;<br>
   <br>
    <br>
   *  字段转成json的字符串<br>
   *<br>
   *  @return json 字符串<br>
   */<br>
   - (NSString *)toJSONStringForDictionary;<br>
   @end<br>
   <br>
   @interface NSMutableDictionary (Category)<br>
   - (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;<br>
   <br>
   - (id)safeObjectForKey:(id<NSCopying>)aKey;<br>
   @end<br>
<br>
   ###NSObject<br>
   **NSObject**部分包括：<br>
   1.为当前object动态增加属性<br>
<br>
   @property (nonatomic, strong, readonly) NSMutableArray *associatedObjectNames;<br>
   <br>
   //为当前object动态增加分类<br>
   - (void)objc_setAssociatedObject:(NSString *)propertyName value:(id)value policy:(objc_AssociationPolicy)policy;<br>
   <br>
   //获取当前object某个动态增加的分类<br>
   - (id)objc_getAssociatedObject:(NSString *)propertyName;<br>
   <br>
   //删除动态增加的所有分类<br>
   - (void)objc_removeAssociatedObjects;<br>
   <br>
   //获取对象的所有属性<br>
   - (NSArray *)getProperties;<br>
<br>
   2.dispatch主线程和非主线程的快捷写法<br>
<br>
   // try catch<br>
   + (NSException *)tryCatch:(void(^)())block;<br>
   + (NSException *)tryCatch:(void(^)())block finally:(void(^)())aFinisheBlock;<br>
   <br>
   // 在主线程运行block<br>
   + (void)performInMainThreadBlock:(void(^)())aInMainBlock;<br>
   <br>
   //延时在主线程运行block<br>
   + (void)performInMainThreadBlock:(void(^)())aInMainBlock afterSecond:(NSTimeInterval)delay;<br>
   <br>
   //在非主线程运行block<br>
   + (void)performInThreadBlock:(void(^)())aInThreadBlock;<br>
   <br>
   //延时在非主线程运行block<br>
   + (void)performInThreadBlock:(void(^)())aInThreadBlock afterSecond:(NSTimeInterval)delay;<br>
<br>
   3.Runtime 覆盖方法、交换方法<br>
<br>
   + (BOOL)overrideMethod:(SEL)origSel withMethod:(SEL)altSel;<br>
   <br>
   + (BOOL)overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;<br>
   <br>
   + (BOOL)exchangeMethod:(SEL)origSel withMethod:(SEL)altSel;<br>
   <br>
   + (BOOL)exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;<br>
  <br>
   ### UIView && UIImage && UIButton && UIColor
   **UIView**：<br>
<br>
   @interface UIView (Category)<br>
   //把View加在Window上<br>
   - (void) addToWindow;<br>
   @end<br>
   <br>
   @interface UIView (Screenshot)<br>
   //View截图<br>
   - (UIImage*) screenshot;<br>
   <br>
   //ScrollView截图 contentOffset<br>
   - (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;<br>
   <br>
   //View按Rect截图<br>
   - (UIImage*) screenshotInFrame:(CGRect)frame;<br>
   @end<br>
   <br>
   @interface UIView (Animation)<br>
   //左右抖动动画<br>
   - (void) shakeAnimation;<br>
   <br>
   //旋转180度<br>
   - (void) trans180DegreeAnimation;<br>
   @end<br>
<br>
   <br>
   **UIImage**：这里内容很多我只列出一部分，具体的大家可以down或者clone下来之后仔细看<br>
   `<br>
   //由颜色生成图片<br>
   + (UIImage *) imageWithColor:(UIColor*)color;<br>
   <br>
   //将图片剪裁至目标尺寸<br>
   + (UIImage *) imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;<br>
   <br>
   //图片旋转角度<br>
   - (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;<br>
   <br>
   //拉伸图片UIEdgeInsets<br>
   - (UIImage *) resizableImage:(UIEdgeInsets)insets;<br>
   <br>
   //拉伸图片CGFloat<br>
   - (UIImage *) imageByResizeToScale:(CGFloat)scale;<br>
   <br>
   //放大图片CGSize<br>
   - (UIImage *) imageByResizeWithMaxSize:(CGSize)size;<br>
   <br>
   //小样图图片CGSize<br>
   - (UIImage *) imageWithThumbnailForSize:(CGSize)size;<br>
   <br>
   //通过Rect剪裁图片<br>
   - (UIImage *) imageByCropToRect:(CGRect)rect;<br>
<br>
   
   **UIButton**：非常推荐大家使用扩大点击范围的方法（非常实用）
<br>
   //扩大点击范围，实用性非常强的一个方法，极力推荐<br>
   - (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;<br>
   <br>
   //快速添加按钮响应方法，默认为TouchUpInside<br>
   - (void)addCallBackAction:(ButtonActionCallBack)action;<br>
   <br>
   //快速添加按钮响应方法<br>
   - (void)addCallBackAction:(ButtonActionCallBack)action
   forControlEvents:(UIControlEvents)controlEvents;<br>
   <br>
   **UIColor**:rgb、二进制、十六进制转换
<br>
   //功能:通过RGB创建颜色<br>
   UIColor *rgb(CGFloat red, CGFloat green, CGFloat blue);<br>
   <br>
   //功能:通过RGB以及alpha创建颜色<br>
   UIColor *rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);<br>
   <br>
   @interface UIColor (Category)<br>
   // Create a color from a HEX string.<br>
   + (UIColor *)hex:(NSString *)hexString;<br>
   <br>
   //通过0xffffff的16进制数字创建颜色<br>
   + (UIColor *)colorWithRGB:(NSUInteger)aRGB;<br>
   <br>
   //调节颜色的明亮度<br>
   + (UIColor*) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;<br>
   <br>
   //调整颜色的透明度<br>
   + (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;<br>
   @end<br>
<br>
   #结语<br>
   这边把一些常用的类别给大家列举了一些，基本每个方法都是我在实际项目因为某些需求写的、还有部分是网上找的。如果不会使用可以来询问我，发现错误请及时联系我，不喜勿喷，谢谢~<br>
   PS:这边就不兼容Pods了，**因为APP在启动的时候会加载所有的分类，全部添加可能会影响启动速度，所以大家可以看了概要之后请选择性的添加**~<br>
   以后我还会持续更新的！最后放出传送门。。麻烦下载的同学给点个星或者点个赞 ，谢谢啦！<br>

