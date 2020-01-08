# Context Basics

## Synopsis

A Context is a container containing configuration settings, meta-information and custom logic that logically belong together.
Contexts are then loaded - one Context alone or multiple ones together.
Once loaded their combination makes up the desired state for the targeted dcs / domain / forest.

After loading is completed, you can use:

```powershell
Test-AdmfDomain
Test-AdmfForest
Invoke-AdmfDomain
Invoke-AdmfForest
```

To either test an existing domain/forest or bring it into compliance with the desired state.

## Creating a Context

To create a new Context, run the following command:

```powershell
New-AdmfContext -Name Contextname
```

This is the simple-most way to create a Context and will spawn the entire folder scaffold and some documentation to help getting started.
To open the Context, run the following command:

```powershell
Invoke-Item (Get-AdmfContext -Name Contextname).Path
```

You can then start inserting [Components](../components/components.html)

## Properties

When you then run:

```powershell
Get-AdmfContext | Format-List
```

you can see that a Context has a variety of properties:

> Version

Multiple versions of the same Context can exist at the same time.
When using `Set-AdmfContext` or using the UI Context prompt, only the latest version it can find is used.

> Store

A Context Store is a path where the system knows to look for Contexts.
For more details, see [documentation for Context Stores](../advanced/context-stores.html).

Short form: A Context must be stored in one of those registered paths, in order for it to be used.
You can add as many such paths as desired.

> Path

The full path to the Context data.

> Description

Documentation.
Write something helpful to make sure users pick the right Context when it matters.

> Weight

When loading multiple Contexts, they are processed in a specific order:
The lower the number, the earlier they are loaded.
In case of conflicting settings, the last Context to be loaded wins.

> Author

Pure documentation.

> Prerequisites

List of Contexts that must be loaded, in order for this Context to be allowed to load.

More details in [Contexts (Advanced)](../advanced/contexts-advanced.html).

> MutuallyExclusive

List of Contexts that cannot be chosen together with this Context.

More details in [Contexts (Advanced)](../advanced/contexts-advanced.html).

> Group

In the UI Context prompt, Contexts are grouped by this property.

## Loading Contexts

There are three ways to load a context:

### Automatic Context Selection

You could just start executing `Test-*` or `Invoke-*` commands against a domain.
If no Context has been selected for the target domain yet, it will automatically prompt you using a selection GUI.

After picking a set of Contexts once (using this or one of the other options), it will no longer prompt to select a Context anymore.

### Interactive Mode

If you want to explicitly call the Context selection GUI (for example to reset the Context choice for a domain in a convenient manner), use the `Set-AdmfContext` command:

```powershell
Set-AdmfContext -Interactive -Server contoso.com
```

This will override the current settings for contoso.com.

### Explicit Mode

Sometimes precision matters, and sometimes user interactivity using the GUI is undesirable.
For that, you also use `Set-AdmfContext`, but explicitly state the Contexts to load:

```powershell
Set-AdmfContext -Server contoso.com -Context Context1, Context2, Context3
```

> Similar to using the GUI, this will also import the _latest_ version of the specified Contexts.

If you want to explicitly control which version of a Context from which [Store](../advanced/context-stores.html), you need to retrieve the Context-objects first using `Get-AdmfContext`, select the desired objects and specify them as input for the `-Context` parameter.

## Deleting Contexts

To delete a Context, simply remove its folder.
There are no other related settings registered anywhere - once the folder is gone, the Context is gone.

## More Information

You can follow up for more related details here:

+ [Contexts (Advanced)](../advanced/contexts-advanced.html)
+ [Context Stores](../advanced/context-stores.html)
+ [Content Mode: Just where do we look for undesirable objects in AD](contentmode.html)
+ [Components: Just what can you put into a Context](../components/components.html)
