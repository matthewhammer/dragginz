import TrieMap "mo:base/TrieMap";
import Hash "mo:base/Hash";
import Types "./types"


actor Database {

// not sure how this works
//
  //public module ID {
  //  public type Equal<ID> = (ID, ID) -> Bool;
  //  public type Hash<ID> = (ID -> Hash.Hash);
 // };

    public type ID = Word32;

    // Data store
    var dataStore : TrieMap.TrieMap<ID, Types.Entity> = TrieMap.TrieMap<ID, Types.Entity>(
        func(x, y) { x == y },
        func(id : ID) { id },    // don't think this actually hashes it
    );
    private stable var nextID : ID = 0;

    // create
    public func create(e : Types.Entity) : async ID {
        nextID += 1;
        dataStore.put(nextID, e);
        return nextID;
    };

    // read 
    public query func read(id : ID) : async ?Types.Entity {
        return dataStore.get(id)
    };

    // update
    public func update(id : ID, r : Types.Entity) : async ?Types.Entity {
        return dataStore.replace(id, r)
    };

    // delete
    public func delete(id : ID) {
        dataStore.delete(id)
    }

} 