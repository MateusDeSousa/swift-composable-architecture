import CoreLocation
import ComposableArchitecture

extension LocationManagerClient {
  public static func mock(
    authorizationStatus: @escaping () -> CLAuthorizationStatus = { fatalError("authorizationStatus is unimplemented in the mock") },
    create: @escaping (_ id: AnyHashable) -> Effect<LocationManagerAction, Never> = { _ in fatalError("create is unimplemented in the mock.", file: #file, line: #line) },
    destroy: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError() },
    locationServicesEnabled: @escaping () -> Bool = { fatalError("locationServicesEnabled is unimplemented in the mock.") },
    requestLocation: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError("requestLocation is unimplemented in the mock.") },
    requestAlwaysAuthorization: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError() },
    requestWhenInUseAuthorization: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError("requestWhenInUseAuthorization is unimplemented in the mock") },
    startMonitoringVisits: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError() },
    startUpdatingLocation: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError() },
    stopMonitoringVisits: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError() },
    stopUpdatingLocation: @escaping (AnyHashable) -> Effect<Never, Never> = { _ in fatalError() },
    update:
    @escaping (
      _ id: AnyHashable,
      _ activityType: CLActivityType?,
      _ allowsBackgroundLocationUpdates: Bool?,
      _ desiredAccuracy: CLLocationAccuracy?,
      _ distanceFilter: CLLocationDistance?,
      _ pausesLocationUpdatesAutomatically: Bool?,
      _ showsBackgroundLocationIndicator: Bool?
    ) -> Effect<Never, Never> = { _, _, _, _, _, _, _ in fatalError() }
  ) -> Self {
    Self(
      authorizationStatus: authorizationStatus,
      create: create,
      destroy: destroy,
      locationServicesEnabled: locationServicesEnabled,
      requestLocation: requestLocation,
      requestAlwaysAuthorization: requestAlwaysAuthorization,
      requestWhenInUseAuthorization: requestWhenInUseAuthorization,
      startMonitoringVisits: startMonitoringVisits,
      startUpdatingLocation: startUpdatingLocation,
      stopMonitoringVisits: stopMonitoringVisits,
      stopUpdatingLocation: stopUpdatingLocation,
      update: update
    )
  }
}