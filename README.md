# BamToolkit v2

This repository repesents the tools that compose the Bam Toolkit.  Each Bam tool is included as a submodule.

The individual tools included with the Bam Toolkit are as follows:

- bamheart - the core of a Bam Application installation.  Provides all core functionality.  Manages the following tools.
  - bamd - manages sub-processes, included as separate application level utilities, that an application may be dependent on.
  - bambot - a remote command execution agent.
  - bamdns - a Bam Application specific DNS server.
  - bamfs - a Bam Application distributed file system manager.
- bamdb - provides an ORM, RDBMS wrapper to common databases and No-SQL functionality over a REST based data access API.
- bamweb - provides templated HTML UI.
- bamapi - provides an RPC based API exposed as HTTP(S) endpoints.
- bam - a CLI to manage all tools above.