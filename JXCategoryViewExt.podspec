Pod::Spec.new do |s|
  s.name         = "JXCategoryViewExt"
  s.version      = "1.2.1"
  s.summary      = "JXCategoryView extensions and optimize"
  s.homepage     = "https://github.com/QuintGao/JXCategoryViewExt"
  s.license      = "MIT"
  s.author       = { "QuintGao" => "1094887059@qq.com" }
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/QuintGao/JXCategoryViewExt.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.default_subspec = 'Core'
  
  # ――― 基础组件 ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'Core' do |ss|
    ss.source_files = 'JXCategoryView/Core/**/*.{h,m}'
    ss.resource_bundles = {"JXCategoryViewExt" => ["JXCategoryView/Core/PrivacyInfo.xcprivacy"]}
  end
  
  # ――― 分类 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'Title' do |ss|
    ss.source_files = 'JXCategoryView/Title'
    ss.dependency 'JXCategoryViewExt/Core'
  end
  
  s.subspec 'SubTitle' do |ss|
    ss.source_files = 'JXCategoryView/SubTitle'
    ss.dependency 'JXCategoryViewExt/Title'
  end
  
  s.subspec 'SubTitleImage' do |ss|
    ss.source_files = 'JXCategoryView/SubTitleImage'
    ss.dependency 'JXCategoryViewExt/SubTitle'
  end
  
  s.subspec 'Image' do |ss|
    ss.source_files = 'JXCategoryView/Image'
    ss.dependency 'JXCategoryViewExt/Core'
  end
    
  s.subspec 'TitleImage' do |ss|
    ss.source_files = 'JXCategoryView/TitleImage'
    ss.dependency 'JXCategoryViewExt/Title'
  end
  
  s.subspec 'TitleAttribute' do |ss|
    ss.source_files = 'JXCategoryView/TitleAttribute'
    ss.dependency 'JXCategoryViewExt/Title'
  end
  
  s.subspec 'Dot' do |ss|
    ss.source_files = 'JXCategoryView/Dot'
    ss.dependency 'JXCategoryViewExt/Title'
  end
    
  s.subspec 'DotZoom' do |ss|
    ss.source_files = 'JXCategoryView/DotZoom'
    ss.dependency 'JXCategoryViewExt/Title'
  end

  s.subspec 'Number' do |ss|
    ss.source_files = 'JXCategoryView/Number'
    ss.dependency 'JXCategoryViewExt/Title'
  end
  
  s.subspec 'Badge' do |ss|
    ss.source_files = 'JXCategoryView/Badge'
    ss.dependency 'JXCategoryViewExt/Title'
  end
  
  s.subspec 'VerticalZoomTitle' do |ss|
    ss.source_files = 'JXCategoryView/VerticalZoomTitle'
    ss.dependency 'JXCategoryViewExt/Title'
  end
  
  # ――― 指示器 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'Indicator' do |ss|
    ss.subspec 'Background' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/Background'
      sss.dependency 'JXCategoryViewExt/Core'
    end
      
    ss.subspec 'Line' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/Line'
      sss.dependency 'JXCategoryViewExt/Core'
    end
    
    ss.subspec 'AlignmentLine' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/AlignmentLine'
      sss.dependency 'JXCategoryViewExt/Indicator/Line'
    end
    
    ss.subspec 'RainbowLine' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/RainbowLine'
      sss.dependency 'JXCategoryViewExt/Indicator/Line'
    end
  
    ss.subspec 'Image' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/Image'
      sss.dependency 'JXCategoryViewExt/Core'
    end
    
    ss.subspec 'Ball' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/Ball'
      sss.dependency 'JXCategoryViewExt/Core'
    end
    
    ss.subspec 'Triangle' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/Triangle'
      sss.dependency 'JXCategoryViewExt/Core'
    end
        
    ss.subspec 'DotLine' do |sss|
      sss.source_files = 'JXCategoryView/Indicator/DotLine'
      sss.dependency 'JXCategoryViewExt/Core'
    end
  end
  
  # ――― 其他 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'RTL' do |ss|
    ss.source_files = 'JXCategoryView/RTL'
    ss.dependency 'JXCategoryViewExt/Core'
  end
end
