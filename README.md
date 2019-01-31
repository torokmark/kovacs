# Kovacs

Kovacs is a simple gem that helps you generate fake data for a person entity based on real life names, nationalities and sex.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kovacs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kovacs

## Usage

### 1. Simpliest

Just simply generate a person. It takes a nationality from the listed nationalities placed inside the `resources` folder. (nationality has to be a folder as well.)  
Then it generates a sex and based on these two, it generates names.

```ruby
p Kovacs.generate
# => #<Kovacs::Person:0x0000560e4a3b54f8 @nationality=:slovak, @sex=:male, @forename="Elek", @middle_name="Erno", @surname="Toth">
p Kovacs.generate.to_h
# => {:nationality=>:slovak, :sex=>:male, :forename=>"Miroslav", :middle_name=>"Jan", :surname=>"Cvikota"} 
```

### 2. Generate just one of the attributes

```ruby
p Kovacs.forename(['Jancsi', 'Julcsi'])
# => "Jancsi" 
```

### 3. Generate via config

```ruby
person = Kovacs.config do |config|
  config.surname     = :hungarian
  config.forename    = 'Elek'
  config.middle_name = ['Karoly', 'Erno', 'Ervin']
  config.sex         = :male
  config.nationality = [:hungarian, :slovak]
end.generate

p person
# => #<Kovacs::Person:0x0000560e4a3b54f8 @nationality=:slovak, @sex=:male, @forename="Elek", @middle_name="Erno", @surname="Toth"> 
```

### 4. Acceptable arguments

1. *None*: will be generated based on the nationalities, sex and list of names placed in `resources`.

```ruby
Kovacs.forename
```

2. *Simple String*: the value will be the string argument itself.

```ruby
Kovacs.forename('Jancsi')
```

3. *Symbol*: symbol represents the nationality. Value will be generated based on the specified nationality, and sex which is randomly generated.

```ruby
Kovacs.forename(:hungarian)
```

4. *Nationality and sex*: Value will be generated based on the spedified nationality and the specified sex.

```ruby
Kovacs.forename(:hungarian, :male)
```

5. *Array of Strings*: One of them will be taken randomly.

```ruby
Kovacs.forename(['Jancsi', 'Julcsi'])
```

6. *Array of Symbols*: One of them will be taken randomly, name is taken randomly based on that nationality.

```ruby
Kovacs.forename([:hungarian, :slovak])
```

7. *Array of Symbols and sex*: Nationality will be taken randomly, name is taken randomly based on that nationality and specified sex. 

```ruby
Kovacs.forename([:hungarian, :slovak], :female)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/torokmark/kovacs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Kovacs project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/torokmark/kovacs/blob/master/CODE_OF_CONDUCT.md).
