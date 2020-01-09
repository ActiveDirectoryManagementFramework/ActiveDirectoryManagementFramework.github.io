# Callbacks

The Callback system is a way to register a scriptblock that will execute each time any [Component](../components/components.html) is tested or invoked.
This allows integrating logic, for example to validate configuration, prompt for user choice or ... really anything else you want to trigger off it.

> Originally, this was built to ensure the GUI [Context](contexts-advanced.html) prompt executes, when targeting a new domain.

When running one of those commands, all callbacks will sequentially be called. Keep execution time in mind, as this might cause a significant delay in execution, especially when chaining multiple commands!
Any uncaught exception in any scriptblock will cause the execution of the [Component](../components/components.html) to fail.

The scriptblocks will each receive four arguments:

+ The Server targeted (if any)
+ The credentials used to do the targeting (if any)
+ The Forest the two earlier pieces of information map to (if any)
+ The Domain the two earlier pieces of information map to (if any)

Any and all of these pieces of information may be empty.

Commands to manage the callbacks:

+ Register-DMCallback
+ Get-DMCallback
+ Unregister-DMCallback
+ Register-FMCallback
+ Get-FMCallback
+ Unregister-FMCallback

> Since the domain and forest Categories are implemented in separate, independent modules, each has its own callback handling.
> However, both implementations are identical.
