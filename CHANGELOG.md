# qlever

## 0.4.0

### Minor Changes

- e1512c7: Permissions were updated to make sure that the server and the UI can run without any issue with any user ID.
  The persistent data is now stored in the `/data` directory.
  Make sure to update your deployments/stacks to use the new path.
  The default user is now `nobody` (UID: 65534).

## 0.3.1

### Patch Changes

- d4c9ed2: Upgrade `qlever` CLI to 0.5.12

## 0.3.0

### Minor Changes

- 861a0d3: Add support for petrimaps.

  To configure the button that redirects to the map view, just define the `MAP_VIEW_BASE_URL` environment variable for the UI container.
  The default value is `""`, which will not display any button to open the map view.

## 0.2.0

### Minor Changes

- 43fac9a: Check if the data needs to be downloaded and if the index needs to be computed.

### Patch Changes

- cbc49cf: Upgrade base image to `adfreiburg/qlever:latest@sha256:90c4b7646489e3ea39a9f683b513b966ef435cbf9be6ccfc6b4c88e9446e476b`

## 0.1.3

### Patch Changes

- 78540d7: Upgrade server to latest@sha256:921390670128231d772be55817b2ed79484989f3891b1318e5f568d96f2249ae

## 0.1.2

### Patch Changes

- 5605f07: Bump qlever server to commit-2ebca4d
- 752f237: Bump qlever cli to 0.5.8

## 0.1.1

### Patch Changes

- c1f3518: Upgrade Docker base images

## 0.1.0

### Minor Changes

- 5e31a9c: First release
