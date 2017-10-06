Pod::Spec.new do |s|

  s.name         = "ReactiveCocoa"
  s.version      = "2.5.1"
  s.summary      = "The 2.x ReactiveCocoa Objective-C API: Streams of values over time"

  s.description  = <<-DESC.strip_heredoc
                     ReactiveCocoa (formally ReactiveCocoa or RAC) is an Objective-C
                     framework inspired by [Functional Reactive Programming](
                     http://en.wikipedia.org/wiki/Functional_reactive_programming).
                     It provides APIs for composing and **transforming streams of values**.
                   DESC

  s.homepage     = "https://reactivecocoa.io"
  s.screenshots  = "https://reactivecocoa.io/img/logo.png"
  s.license      = { type: "MIT", file: "LICENSE.md" }

  s.documentation_url  = "https://github.com/ReactiveCocoa/ReactiveCocoa/"\
                         "tree/master/Documentation#readme"

  s.author             = "ReactiveCocoa"
  s.social_media_url   = "https://twitter.com/ReactiveCocoa"

  s.ios.deployment_target     = "8.0"
  s.osx.deployment_target     = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target    = "9.0"

  s.source = { git: "https://github.com/VladimirLyseev/ReactiveCocoa.git",
               tag: s.version }

  s.source_files          = "ReactiveCocoa/*.{h,m,d}",
                            "ReactiveCocoa/extobjc/*.{h,m}"

  s.ios.exclude_files     = "ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable}*"

  s.osx.exclude_files     = "ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,"\
                            "UIButton,UICollectionReusableView,UIControl,UIDatePicker,"\
                            "UIGestureRecognizer,UIImagePicker,UIRefreshControl,"\
                            "UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,"\
                            "UITableViewHeaderFooterView,UIText,MK}*"

  s.tvos.exclude_files    = "ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable,UIActionSheet,"\
                            "UIAlertView,UIDatePicker,UIImagePicker,UIRefreshControl,UISlider,"\
                            "UIStepper,UISwitch,MK}*"

  s.watchos.exclude_files = "ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,"\
                            "UIButton,UICollectionReusableView,UIControl,UIDatePicker,"\
                            "UIGestureRecognizer,UIImagePicker,UIRefreshControl,"\
                            "UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,"\
                            "UITableViewHeaderFooterView,UIText,MK,AppKit,NSControl,NSText,"\
                            "NSTable,NSURLConnection}*"

  s.requires_arc = true

  s.frameworks   = "Foundation"

  s.prepare_command = <<-'CMD'.strip_heredoc
                        find -E . -type f -not -name 'RAC*' -regex '.*(EXT.*|metamacros)\.[hm]$' \
                                  -execdir mv '{}' RAC'{}' \;
                        find . -regex '.*\.[hm]' \
                               -exec perl -pi \
                                          -e 's@"(?:(?!RAC)(EXT.*|metamacros))\.h"@"RAC\1.h"@' '{}' \;
                        find . -regex '.*\.[hm]' \
                               -exec perl -pi \
                                          -e 's@<ReactiveCocoa/(?:(?!RAC)(EXT.*))\.h>@<ReactiveCocoa/RAC\1.h>@' '{}' \;
                      CMD

end