# CurlyProductCheck

<!-- Put your Ruby code in the file `lib/curly_product_check`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem -->

Welcome to the Curly Product Check for Ulta Beauty Online! Use this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'curly_product_check'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install curly_product_check

## Usage

This CLI will display whether an ingredient contains a helpful or harmful alcohol for curly hair from the products sold on Ulta.com. 

This CLI is designed to help the user decide if a hair product will fit their curly hair needs before purchasing from Ulta, without having to search each product for their list of ingredients. 

Using the CLI, the user will select a Hair Category, then select a Brand, then select a Product, which will display if the product has any of the helpful or harmful alcohols listed below. 

Helpful Alcohols are defined as:
   -  Cetyl Alcohol, Cetearyl Alcohol, Stearyl Alcohol, Lauryl Alcohol
Harmful Alcohols are defined as:
   -  Ethanol alcohol, Ethyl Alcohol, Propanol Alcohol, Alcohol denat, Isopropyl Alcohol, Isopropanol Alcohol, Benzyl Alcohol 

Source for alcohol type is from: 
    https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols

Ulta Beauty Data is scraped from:
https://www.ulta.com/hair?N=26wz


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/curly_product_check. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurlyProductCheck project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/curly_product_check/blob/master/CODE_OF_CONDUCT.md).
