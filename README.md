# Elm + Phoenix

__NOTE:__ This represents Phoenix 1.3. It is finalised but has not been officially released yet. More information [here](https://gist.github.com/chrismccord/71ab10d433c98b714b75c886eff17357).

This is a minimum setup for an Elm + Phoenix project, using webpack for bundling.

This is intended to be a teaching tool rather than a production boilerplate, therefore the webpack config is as small as possible, and there is only very basic Phoenix usage.

The Phoenix application has been named `Foo` to make it easy to identify where your application name is used.

## REQUIREMENTS
- [Elixir](http://elixir-lang.org/)/[Mix](http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html)/[Phoenix](http://www.phoenixframework.org/) ([Installation guide](http://www.phoenixframework.org/docs/installation))
- [Node.js](https://nodejs.org/en/)/[npm](https://www.npmjs.com/) (Install using [nvm](https://github.com/creationix/nvm))
- [Elm](http://elm-lang.org/) (`$ npm install --global elm`)
- A [PostgreSQL](https://www.postgresql.org/) server running on your machine.

## FEATURES
__BACKEND:__  
Basically just `$ mix phx.new foo --no-brunch`, with changes made to `./lib/foo/web/templates/layout/app.html.eex` and `./lib/foo/web/templates/page/index.html.eex` to load up the Elm app.  
__FRONTEND:__  
All related files are found in `./assets`, including `package.json`, `elm-package.json` and `webpack.config.js`. Therefore `npm install` and `elm-package install` will have to be run from there.  
__SCRIPTS:__  
As a convenience due to the location of `package.json`, I have added a custom mix task (`./lib/mix/npm.ex`) which allows the execution of `npm run` scripts from the project root using mix: `mix npm build`, `mix npm watch`, etc.

## USAGE
__INITIAL SETUP:__
- `$ cd assets`
- `$ npm install` (Gets npm dependencies)
- `$ elm-package install` (Gets Elm dependencies)
- `$ cd ..`
- `$ mix deps.get` (Gets Phoenix dependencies)
- `$ mix ecto.create` (Sets up database)

__TO RUN:__
- `$ mix npm build` or `$ mix npm watch`
- `$ mix phx.server`
- Visit http://localhost:4000.
