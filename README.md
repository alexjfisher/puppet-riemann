# puppet-riemann

#### Table of Contents

 1. [Overview](#overview)
 2. [Setup](#setup)
 3. [Usage](#usage)
 4. [Compatibility](#compatibility)

## Overview

This module configures the Riemann event server on a host in the simplest way
possible. It installs Riemann from packages, rather than building from source.

This module is currently only intended for Red Hat hosts (Fedora, CentOS,
RHEL), at least for now.

## Setup

The Riemann RPM needs to be made available to hosts through a software
repository that they have access to. In our case, this is a Pulp server. In
your case, it's anything that works with yum.

The Riemann RPM can be downloaded here: http://riemann.io

## Usage

Here's a basic configuration:

```puppet
class {'::riemann':}
```

## Compatibility

This module is currently only intended for Red Hat hosts (Fedora, CentOS,
RHEL), at least for now.

## Release Notes

2015/05/18 - v0.2.0 release.
