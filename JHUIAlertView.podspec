Pod::Spec.new do |s|
  s.name         = 'JHUIAlertView'
  s.summary      = 'A simple custom AlertView.'
  s.version      = '1.0.6'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Haocold' => 'xjh093@126.com' }
  s.homepage     = 'https://github.com/xjh093/JHUIAlertView'

  s.platform     = :ios, "8.0"

  s.source       = { :git => 'https://github.com/xjh093/JHUIAlertView.git', :tag => s.version}
  
  s.source_files = 'JHUIAlertView/JHUIAlertView/*.{h,m}'
  s.requires_arc = true
  s.framework    = 'UIKit'

end
