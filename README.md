### Running Migrations

`$ sequel -m db/migrations sqlite://db/qcs_development.sqlite`

### Starting the Server

`$ thin -R config.ru start`

Use shotgun to reload changes on the fly...

`$ shotgun config.ru`

### Console

You can access model data from within an IRB session by requiring the `./app/models/init` file. Refer to the [Sequel Cheatsheet](http://sequel.rubyforge.org/rdoc/files/doc/cheat_sheet_rdoc.html) for information on querying models.
