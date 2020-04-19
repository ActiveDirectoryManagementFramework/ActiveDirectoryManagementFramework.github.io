# NTAuthStore

## Synopsis

The NTAuthStore [Component](../components.html) allows you to define certificates to apply to the central enterprise store of trusted certificates.
Useful for rolling out trust to a central PKI in a dedicated forest.

## Defining Configuration

To define the certificates to register, simply drop the .cer files in the `forest/ntAuthStore` folder of a [Context](../../basics/contexts.html).
All certificates thus found will be added to the forest-wide certificate store.

## Authorative and non-Authorative

By default, the [Component](../components.html) only _adds_ certificates to the NTAuthStore without removing certificates not defined (non-Authorative).

Enabling Authorative mode causes it to remove undefined certificates.

To define the authorative mode, create a json file (name not important) in the `forest/ntAuthStore` folder of a [Context](../../basics/contexts.html), formed like this:

```json
{
	Authorative: true
}
```

To disable it, set it to `false` instead.

> If multiple [Contexts](../../basics/contexts.html) define the "authorative" setting, the last context wins.
