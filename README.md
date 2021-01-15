# JXCategoryViewExt

该库是对JXCategoryView的扩展及优化，目前的JXCategoryView版本1.5.8，JXCategoryViewExt版本1.0.0

## 优化及bug修改

#### 优化
1、增加方法，可动态刷新标题和指示器颜色，需使用JXCategoryTitleView
```
/// 刷新所有cell状态
- (void)gk_refreshCellState;

/// 刷新所有指示器状态
- (void)gk_refreshIndicatorState;

/// 刷新所有cell和指示器状态
- (void)gk_refreshCellAndIndicatorState;

```

2、增加属性selectItemOnScrollHalf，可控制在滑动到一半的时候选中下一个item

#### bug修改
1、修复某些情况下将listView的frame设置为CGRectZero导致使用Masonry布局时出现报错

## pod扩展
JXCategoryViewExt优化了JXCategoryView的pod方式，将不同组件进行拆分，可按需pod

#### 基础库
```
pod 'JXCategoryViewExt' 或 pod 'JXCategoryViewExt/Core'
```

#### 分类
```
// 文字
pod 'JXCategoryViewExt/Title'

// 图片
pod 'JXCategoryViewExt/Image'

// 文字+图片
pod 'JXCategoryViewExt/TitleImage'

// 富文本
pod 'JXCategoryViewExt/TitleAttribute'

// title+小红点
pod 'JXCategoryViewExt/Dot'

// title+数字
pod 'JXCategoryViewExt/Number'

// title垂直滚动缩放
pod 'JXCategoryViewExt/VerticalZoomTitle'
```

#### 指示器
```
// 线
pod 'JXCategoryViewExt/Indicator/Line'

// 线+彩虹效果
pod 'JXCategoryViewExt/Indicator/RainbowLine'

// 图片
pod 'JXCategoryViewExt/Indicator/Image'

// 球
pod 'JXCategoryViewExt/Indicator/Ball'

// 三角形
pod 'JXCategoryViewExt/Indicator/Triangle'

// 点线
pod 'JXCategoryViewExt/Indicator/DotLine'
```

