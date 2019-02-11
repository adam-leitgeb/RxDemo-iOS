platform :ios, '11.0'
# swift_version = '4.2'

def common_pods
    use_frameworks!

    pod 'APIAdapter'#, :path => '~/Developer/APIAdapter'
    pod 'BoilerplateKit', '0.1.0'#, :path => '~/Developer/BoilerplateKit'
    pod 'RxSwift',    '~> 4.0'
    pod 'RxBlocking'
    
    # Build
    pod 'SwiftLint'
    pod 'BartyCrouch'
end

target 'RxDemo' do
    common_pods

    target 'Tests' do
        common_pods
    end
end
