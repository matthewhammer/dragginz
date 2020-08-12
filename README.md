# OLD DRAGGINZ 

Here is an example of how we built the data model in Go :  [OLD DSL FILES](examples/dsl/)

# DRAGGINZ TODO 

## A class or module for ID?

Just like in https://github.com/matthewhammer/motoko-crud/blob/master/src/Database.mo it should probably do a lot more, like actually
hashing 

## Pseudorandom UUIDv4 generation

Some entities require a UUID that the users have to respond with to "claim" the entity in the database.  This will eventually be
encrypted somehow, but in the meantime how can I generate a random UUID?  Basically like uuid.NewV4() in Go.

## Custom Types

Instead of the name of a Character or Pet being Text, it needs to be a 20 character string that has specific rules on sanitisation
and validation.  It should disallow 3 or more repeated characters, trim whitespace, and other rules.

How do we create a template type, say "Name" or "PetName" and have these inherit from each other, ie. 
PetName -> Name -> Text, each level adding in extra functionality.

# ??? Questions ???



## File Naming?

dfx new creates a main.mo, but other projects seem to use capital letters for their files.  Types.mo, Database.mo, etc.  Is there a best
way for that sort of thing?

## Storage

Do I need one Trie for each Entity?  How is this going to scale, because some of these Entities will always be limited to a handful
of rows and some will be terabytes of data.

Right now everything's stored in one Trie and that obviously has to change.

## Big Files

So the current design has about 185 tables, but that's a SQL data model so it includes join tables and enums and other such things
that we wouldn't need within Motoko.  This could easily be over 300 tables by the time the game goes live.

Go automatically includes all the files in one directory, and I *still* had to split it into subdirectories.  What is the best way
to handle this in Motoko?  Don't really fancy one file with 20,000 lines, or even a massive list of includes.