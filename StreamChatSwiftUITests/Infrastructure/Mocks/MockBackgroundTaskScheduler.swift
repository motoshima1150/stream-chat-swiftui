//
// Copyright © 2022 Stream.io Inc. All rights reserved.
//

import Foundation
@testable import StreamChat

class MockBackgroundTaskScheduler: BackgroundTaskScheduler {
    var beginBackgroundTask_called: Bool = false
    var beginBackgroundTask_expirationHandler: (() -> Void)?
    var beginBackgroundTask_returns: Bool = true
    func beginTask(expirationHandler: (() -> Void)?) -> Bool {
        beginBackgroundTask_called = true
        beginBackgroundTask_expirationHandler = expirationHandler
        return beginBackgroundTask_returns
    }

    var endBackgroundTask_called: Bool = false
    func endTask() {
        endBackgroundTask_called = true
    }

    var startListeningForAppStateUpdates_called: Bool = false
    var startListeningForAppStateUpdates_onBackground: (() -> Void)?
    var startListeningForAppStateUpdates_onForeground: (() -> Void)?
    func startListeningForAppStateUpdates(
        onEnteringBackground: @escaping () -> Void,
        onEnteringForeground: @escaping () -> Void
    ) {
        startListeningForAppStateUpdates_called = true
        startListeningForAppStateUpdates_onBackground = onEnteringBackground
        startListeningForAppStateUpdates_onForeground = onEnteringForeground
    }
    
    var stopListeningForAppStateUpdates_called: Bool = false
    func stopListeningForAppStateUpdates() {
        stopListeningForAppStateUpdates_called = true
    }
}
