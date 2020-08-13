# What is Dragginz?

Dragginz is a virtual fantasy world.  It's built by the users, but adheres to a strict style guide set by the
Dragginz Team (currently 6 of us working on the project.)  It's a non profit venture that's owned by the community.
All revenue made from the game will go directly back into maintenance and development costs.

Our stack is currently Unity, SpatialOS/Improbable, and we're looking to replace everything else with DFinity.

Currently we are attempting to assemble a giant data model (500+ entities) with validation and filtering/sanitisation
rules.  It's imperative that all the data that builds this world is carefully curated and error checked.  Previously we
used CockroachDB as our storage layer.

The best explanation I can give for the project is an unholy cross between Minecraft, Neopets, WoW and Dwarf Fortress
set in a very vertical, 3D Labyrinth/Dark Crystal type world.

---

# Notes

Don't worry about code formatting right now, it may not be "idiomatic" because VSCode doesn't seem to have any nice
auto-formatting tools for Motoko.

---

# ~~ TODO ~~

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

## Entity Metadata

How do we separate the fields of an entity from metadata?  Is it a case of Rarity { RarityData, Metadata }, how should that be set up
and how should the actual values be initialised?

---

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

## Reserved Words

We have an Entity called Class.  This was fine in Go because it was upper case, but we're using #class as an identifier which

## ID within Entity

Is there any need to store the ID inside an entity, potentially duplicating data because the ID is the key used in the map.  However
the key could be a hash, so I guess we should.

## Class Inheritance

Is there composition or inheritance?  So if I've got 180 entity types and wanted each one to have a Created and Updated timestamp
field, does it have to be added manually to each type?

## Tuples

Let's say you've got a many to many relation where Pupil )----( Class, and then we wanted to add a separate "Grade" into each row of
the relationship.  In SQL we could have a table ( pupil_id, class_id, grade ) with a PK on pupil_id and class_id.  When defining
the Pupil type in Motoko what's the best way to represent this as I'm not familiar with the nuances of the language or even the basics.

## Types with Constructors?

We can make a Types.String type for a field, but how could we do something like Types.String(20), where the field can take constructor
arguments that can be used for validation, truncation etc.

## Template vs Instance

PetTemplate and Pet being the in-game instance of a Pet, or Pet being the template and PetInstance being the instance?  Is it possible
to come up with a good naming convention?

## Fixtures

Need a good way to instantiate data that's static and unchanging, such as the different levels of Rarity.  Could potentially tables
like Rarity, AreaGuide, LengthGuide be stored in a different format?