# shvarov-persistent
This is a base class that brings two TS properties added to your persistent class, providing time stamps on when it the instance was created and every time it was updated:
```ObjectScript
Property CreatedAt: %TimeStamp;
Property LastUpdate: %TimeStamp;
```


## Installation

module is available on InterSystems Open Exhcange and in a community IPM registry as shvarov-persistent
In IRIS terminal or programmatically do:
```
zpm "install shvarov-persistent"
```

or as dependency in your module.xml, within <Module> section:

```XML
<Dependencies>
        <ModuleReference>
          <Name>shvarov-persistent</Name>
          <Version>1.*.*</Version>
        </ModuleReference>
</Dependencies>

```

this will install shvarov.persistent package into your IRIS system.



## How to Use it

derive shvarov.persistent.base after %Persistent class - this will give you these CreatedAt and LastUpdate properties automatically, e.g.
```ObjectScript
Class your.persistent.class Extends (%Persistent, shvarov.persistent.base, %JSON.Adaptor)

```



## Installation for development and contribution

Clone/git pull the repo into any local directory

```
$ git clone git@github.com:intersystems-community/iris-persistent-class.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## unit testing
to run unit-tests execute:

USER>zpm "shvarov-persistent"

# support 

this is an open source and use it at your own risk. Feel free to submit issues to the repo and pull requests are more than welcomed

# contribution

Contribution and feedback are very welcome