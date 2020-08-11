import Hash "mo:base/Hash";
import TrieMap "mo:base/TrieMap";

actor Rarity {

    public type ID = Word32;
    public type Rarity = {
        name: Text;
        weighting: Float;
    };

    public type Equal<ID> = (ID, ID) -> Bool;
    public type Hash<ID> = ID -> Hash.Hash;

    // Data store
    var data : TrieMap.TrieMap<ID, Rarity> = TrieMap.TrieMap<ID, Rarity>(Equal, Hash);
    private stable var nextID : ID = 0;

    // create
    public func create(r : Rarity) : async ID {
        nextID += 1;
        data.put(nextID, r);
        return nextID;
    };

    // read
    public query func read(id : ID) : async ?Rarity {
        return data.get(id)
    };

    // update
    public query func update(id : ID, r : Rarity) : async Bool {
        return true
    };

} 