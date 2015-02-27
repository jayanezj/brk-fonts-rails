# brk-fonts-rails [![Gem Version](https://badge.fury.io/rb/brk-fonts-rails.svg)](http://badge.fury.io/rb/brk-fonts-rails)[![Build Status](https://travis-ci.org/berikin/brk-fonts-rails.svg?branch=v1.0.3)](https://travis-ci.org/berikin/brk-fonts-rails)
brk-fonts-rails provides the
[Brk-Fonts](http://brkfonts.jimenezfrontend.es) web fonts and
stylesheets as a Rails engine for use with the asset pipeline.

## Installation

Add this to your Gemfile:

```ruby
gem "brk-fonts-rails"
```

and run `bundle install`.

## Usage

In your `application.css`, include the css file:

```css
/*
 *= require brk-fonts
 */
```
Then restart your webserver if it was previously running.

Congrats! You now have scalable vector icon support. See the cheatsheet at
[Brk-Fonts cheatsheet](http://brkfonts.jimenezfrontend.es/cheatsheet/complete).

### Sass Support

If you prefer [SCSS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), add this to your
`application.css.scss` file:

```scss
@import "brk-fonts";
```

If you use the
[Sass indented syntax](http://sass-lang.com/docs/yardoc/file.INDENTED_SYNTAX.html),
add this to your `application.css.sass` file:

```sass
@import brk-fonts
```

### Helpers

There are also some helpers (`brk_icon`).

```ruby
brk_icon "ruby"
# => <i class="brk-ruby"></i>

brk_icon "rails", text: "Fantastic Ruby On Rails!"
# => <i class="brk-rails"></i> Fantastic Ruby On Rails!

brk_icon "python", text: "Fear the snake", right: true
# => Fear the snake <i class="brk-python"></i>

brk_icon "mirlodev 4x", class: "pull-left"
# => <i class="brk-mirlodev brk-4x pull-left"></i>

```

**Note:** In Rails 3.2, make sure brk-fonts-rails is outside the bundler asset group
so that these helpers are automatically loaded in production environments.

## Changelog

    | Version |     Codename     | Notes / Other additions                                                           |
    |---------+------------------+-----------------------------------------------------------------------------------|
    |   1.0.0 | Altamira Oriole  | First release, based on Brk Fonts 1.0.0                                           |


**Running on Rails 3.1?** Make sure to use version 3.1.1.0 or earlier.


**Note when deploying to sub-domains**
It is sometimes the case that deploying a Rails application to a production
environment requires the application to be hosted at a sub-domain on the server.
This may be the case, for example, if Apache HTTPD or Nginx is being used as a
front-end proxy server, with Rails handling only requests that come in to a sub-domain
such as `http://myserver.example.com/myrailsapp`. In this case, the
BrkFonts gem (and other asset-serving engines) needs to know the sub-domain,

To fix this, set the *relative URL root* for the application. In the
environment file for the deployed version of the app, for example
`config/environments/production.rb`,
set the config option `action_controller.relative_url_root`:

    MyApp::Application.configure do
      ...

      # set the relative root, because we're deploying to /myrailsapp
      config.action_controller.relative_url_root  = "/myrailsapp"

      ...
    end

The default value of this variable is taken from `ENV['RAILS_RELATIVE_URL_ROOT']`,
so configuring the environment to define `RAILS_RELATIVE_URL_ROOT` is an alternative strategy.

## License

* The [Brk Fonts](http://brkfonts.jimenezfrontend.es) font has all rights reserved ©.
* [Brk Fonts](http://brkfonts.jimenezfrontend.es) CSS files are
  licensed under the
  [GPL License](http://www.gnu.org/copyleft/gpl.html).
* The remainder of the brk-fonts-rails project is licensed under the
  [GPL License](http://www.gnu.org/copyleft/gpl.html).
