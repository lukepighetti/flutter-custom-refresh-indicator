/// Describes state of CustomRefreshIndicator
enum IndicatorState {
  /// #### [CustomRefreshIndicator] is idle (There is no action)
  ///
  /// (`CustomRefreshIndicatorData.value == 0`)
  idle,

  /// #### Whether user is dragging [CustomRefreshIndicator]
  /// ending the scroll **WILL NOT** result in `onRefresh` call
  ///
  /// (`CustomRefreshIndicatorData.value < 1`)
  dragging,

  /// #### [CustomRefreshIndicator] is armed
  /// ending the scroll **WILL** result in:
  /// - `CustomRefreshIndicator.onRefresh` call
  /// - change of status to `loading`
  /// - decreasing `CustomRefreshIndicatorData.value` to `1` in
  /// duration specified by `CustomRefreshIndicator.armedToLoadingDuration`)
  ///
  /// (`CustomRefreshIndicatorData.value >= 1`)
  armed,

  /// #### [CustomRefreshIndicator] is hiding indicator
  /// when `onRefresh` future is resolved or indicator was canceled
  /// (scroll ended when [IndicatorState] was equal to `dragging`
  /// so `value` was less than `1` or the user started scrolling through the list)
  ///
  /// (`CustomRefreshIndicatorData.value` decreases to `0`
  /// in duration specified by `CustomRefreshIndicator.draggingToIdleDuration`)
  hiding,

  /// #### [CustomRefreshIndicator] is awaiting on `onRefresh` call result
  /// When `onRefresh` will resolve [CustomRefreshIndicator] will change state
  /// from `loading` to `hiding` and decrease `CustomRefreshIndicatorData.value`
  /// from `1` to `0` in duration specified by `CustomRefreshIndicator.loadingToIdleDuration`
  ///
  /// (`CustomRefreshIndicatorData.value == 1`)
  loading,

  /// ### IMPORTANT
  /// This state is skipped by default.
  ///
  /// {@template custom_refresh_indicator.complete_state}
  /// If [CustomRefreshIndicator.completeStateDuration] argument is provided to CustomRefreshIndicator,
  /// state will changed from [loading] to [complete] for duration of [CustomRefreshIndicator.completeStateDuration].
  ///
  /// If [CustomRefreshIndicator.completeStateDuration] equals `null`, state
  /// will skip [complete] state and will immediately become [hidding].
  /// {@endtemplate}
  complete,
}

extension IndicatorStateGetters on IndicatorState {
  bool get isIdle => this == IndicatorState.idle;
  bool get isDragging => this == IndicatorState.dragging;
  bool get isArmed => this == IndicatorState.armed;
  bool get isHiding => this == IndicatorState.hiding;
  bool get isLoading => this == IndicatorState.loading;
  bool get isComplete => this == IndicatorState.complete;
}