# Blank iOS Project

Blank iOS project with folder structure, pods, and run scripts.

### Project Structure

```
Project
|
|– AppCoordinator.swift
|– AppDelegate.swift
|– Configuration.swift
|– Global
|–– Cells
|–– Extensions
|–– Views
|– Models
|–– User.swift
|– Services
|–– Base Services
|––– GeneralStateService.swift
|–– Scene Services
|––– OnboardingService.swift
|– Scenes
|–– Onboarding
|––– OnboardingCoordinator.swift
|––– OnboardingViewModel.swift
|––– OnboardingViewController.swift
|––– Onboarding.storyboard
|– Resources
```

### Dependencies

- **AKit**, my own library containing all boilerplate code I'm using across my projects.
  - https://github.com/adam-leitgeb/AKit-iOS
- **BartyCourch**, for easier work with localization.
  - https://github.com/Flinesoft/BartyCrouch
- **CoreDataAdapter**, my own libarary containing a generic wrapper around CoreData.
  - https://github.com/adam-leitgeb/CoreDataAdapter-iOS
- **PromiseKit**, for easier work with asynchronous operations.
  - https://github.com/mxcl/PromiseKit

- **SwiftLint**, for incremental updates of a Strings files from the Code.
  - https://github.com/realm/SwiftLint

