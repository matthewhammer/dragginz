# DRAGGINZ TODO 

## A class or module for ID?

Just like in https://github.com/matthewhammer/motoko-crud/blob/master/src/Database.mo it should probably do a lot more, like actually
hashing 

## Storage

Do I need one Trie for each Entity?  How is this going to scale, because some of these Entities will always be limited to a handful
of rows and some will be terabytes of data.

Right now everything's stored in one Trie and that obviously has to change.

# Questions

## File Naming?

dfx new creates a main.mo, but other projects seem to use capital letters for their files.  Types.mo, Database.mo, etc.  Is there a best
way for that sort of thing?