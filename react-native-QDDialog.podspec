
Pod::Spec.new do |s|
  s.name         = "react-native-QDDialog"
  s.version      = "0.0.1"
  s.summary      = "react-native-QDDialog"
  s.description  = <<-DESC
                  react-native-QDDialog
                   DESC
  s.homepage     = "https://github.com/wu736139669"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "736139669@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wu736139669/react-native-QDDialog.git", :tag => "master" }
  s.source_files  = "ios/*.{h,m}"
  s.requires_arc = true


  #s.dependency "others"
  s.dependency "MBProgressHUD"
end

  