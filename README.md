# Getting Started Guide

[Ample](http://www.helloample.com/) is using [Middleman](http://middlemanapp.com/guides/getting-started) to allow for templating, SASS & CoffeeScript. This is our getting started styles and markup guide. Enjoy.

## Setup

###Get the repo up and running locally:

1. #####Clone the repo#####
```
$ git clone git@github.com:qcs/qcstacks-com.git
```

2. ####Bundle####
```
$ bundle
```

3. #####Clone and rename the build directory to deploy to Github Pages#####
```
$ git clone git@github.com:qcs/qcstacks-com.git -b gh-pages ./build
```
4. #####Add a New Story (Dependent on running ZSH as your shell)#####
```
$ noglob rake create['...']
```
5. #####Deploy the site#####
```
$ rake deploy
```

### Running the server

# Start the middleman server
$ middleman server

### Generate static assets for release:

$ middleman build


