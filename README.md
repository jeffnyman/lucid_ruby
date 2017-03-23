# Lucid Testing (in Ruby)

> **"We have such sights to show you."**
> > Pinhead, _'Hellraiser'_

This repository exists solely to provide a series of contrived, but realistic, examples using a minimal-footprint, low-friction, high-yield test-supporting micro-framework.

The framework in question will be my own [Tapestry](https://github.com/jeffnyman/tapestry).

## General Structure

One thing I like to try and do is keep things as high-level as possible, in terms of directory structure. That way it's clear what goes where and people don't have to navigate down nested paths to find information. Further, this does allow selective display -- or at least selective referencing -- of some information. For example, it's possible to just reference a `config` directory or a `features` directory.

## Configuration

There is a core configuration module in `config/config.rb`. This utilizes specific data files. The `config/config.yml` file contains the default information for whatever is relevant for a given test environment. In the case of this demonstration, a group, a particular server, and a particular user. The details for this information (_which_ group, _which_ server, _which_ user) are located in the `environments.yml` file. The core configuration module contains methods that will read this information on-demand so that it can be used in tests.

There is a `test-configs.rb` file that demonstrates usage.

How this basically works is the _group_ value is read from `config.yml`. Then the `environments.yml` file is searched for a key with the name of that group. Each group will have one or more servers associated with it. The _server_ value from `config.yml` is then matched up, in `environments.yml`, with a server key of that same name within that group. Finally, each group and each server are associated with a user. So the _user_value from `config.yml` is matched up with the relevant user information in `environments.yml`. All of this is what allows a user, with username and password, to login to a specific server.

The easiest place to see all this in use is in `models\home.rb`, where you can see the URL and the user information is referenced.

## Execution

Current execution can be done via the `lucid` script. This is currently just a wrapper for Cucumber.

```
./lucid
```

This will run all of the feature specifications. By default, Chrome will be used as the browser to execute against. You can run against other browsers (assuming you have the browsers and the drivers on your machine).

```
./lucid BROWSER=phantomjs
./lucid BROWSER=firefox
```
