node-identity-server-client
===========================

npm install identity-server-client

Used internally for now. 

## Release Notes

### 0.2.10
* updated to the latest packages

### 0.2.9
* fixed a bug that caused errors not to be propagated.

### 0.2.8
* users.getByIds added

### 0.2.7
* Roles added

### 0.2.6
* Reset password fixed.

### 0.2.5
### 0.2.4
* Removed a log statement.

### 0.2.3
* added methods to add/remove provider

### 0.2.2
* Added X-Act-As-ActorId support
* Added get apps for user method

### 0.2.0

* First version

## Internal Stuff

* npm run-script watch

## Publish new version

* Change version in package.json
git add . -A
git commit -m "Upgrading to v0.2.10"
git tag -a v0.2.10 -m 'version 0.2.10'
git push --tags
npm publish

## Contributing to node-identity-server-client
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the package.json, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Martin Wawrusch See LICENSE for
further details.


