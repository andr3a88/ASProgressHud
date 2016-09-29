#
# Be sure to run `pod lib lint ASProgressHud.podspec' to ensure this is a
# valid spec before submitting.

Pod::Spec.new do |s|
  s.name             = "ASProgressHud"
  s.version          = "0.0.3"
  s.summary          = "A custom loading view inspired by MBProgressHud" 
  s.description      = <<-DESC
                            A custom loading view inspired by MBProgressHud.
                       DESC

  s.homepage         = "https://github.com/andr3a88/ASProgressHud"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Andrea" => "runner_corsa@msn.com" }
  s.source           = { :git => "https://github.com/andr3a88/ASProgressHud.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/andrea_steva'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundle = {
    'Resources' => ['Pod/Assets/**/*.png'] # the ** will recursively check all subfolders of the Assets directory
  }

end
