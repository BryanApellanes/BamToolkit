# BamToolkit v2

This repository repesents the tools that compose the Bam Toolkit.  Each Bam tool is included as a submodule.

The individual tools included with the Bam Toolkit are as follows:

- bamheart - the core of a Bam Application installation.  Provides all core functionality.  Manages the following tools:
- bambot - remote command execution agent. 
- bamd - manages sub-processes, included as separate application level utilities, that an application may be dependent on.
- bamio - provides data input and output services including an ORM, RDBMS wrapper to common databases and No-SQL functionality over a REST based data access API.
- bamfs - Bam Application distributed file system manager.
- bamski - Bam Application social key infrastructure. 
- bamux - provides templated HTML UI and other user experience elements.
- bamapi - provides an RPC based API exposed as HTTP(S) endpoints.
- bamcli - a CLI to manage all tools above.

## BAM CLI commands

### Register a new user

```bash
$ bam register /email:<YOUR_EMAIL> | /phone:<YOUR_MOBILE_NUMBER> [/username:<DESIRED_USERNAME>] [/password:<DESIRED_PASSWORD>]
```

The `register` command regsiters a new user using the specified email or phone number.  If `username` argument is ommitted the specified email value is used as username.

The following steps occur when a new user is registered:

- post email and username to the configured `bamheart` server:
- verification email sent to specified email
- prompt for password if ommitted from command line

### Join device to organization

```bash
$ bam join [/org:<YOUR_ORGANIZATION_NAME>] 
```

The `join` command registers the current device to the specified organization.  If `org` argument is ommitted the default value "PUBLIC" is used.

The following steps occur when a device is joined to an organization:

- ensure user is logged in
- ensure user has necessary access to join a device to the specified organization
- post device registration data to the configured `bamheart` server:
  - HostName - result of the `hostname` command
  - MAC Address(es) - the ethernet address of all network interfaces
  - Ip Address(es) - the ipv4 and/or ipv6 address of all network interfaces
- write registration data received from the `bamheart` server


### Initialize BAM CLI locally

```bash
$ bam init  [/email:<YOUR_EMAIL> /org:<YOUR_ORGANIZATION_NAME> /machine:<TARGET_HOSTNAME>]
```

If `org` and `email` arguments are ommitted the following defaults are used:

- org - "PUBLIC"
- user - the result of the `whoami` command

If 

Initialization creates the specified organization and user.  If either the specified organization or user already