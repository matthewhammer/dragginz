import List "mo:base/List";
import Trie "mo:base/Trie";
import UUIDUtils "./utils/UUID"

actor Rarity {

    public type ID = Word64;
    public type Name = Text;

    public type Rarity = {
        name: Name;
    };

    // Rarity data store.
    private stable var rarities : Trie.Trie<ID, Rarity> = Trie.empty();

    public func create(r : Rarity) : async ID {

        // This line should generate a pseudorandom UUID
        // UUID.
        let id = 1 : ID

          rarities := Trie.replace(
          rarities,
          key(id),
          eq,
          ?r,
        ).0;
        return id;
    };

    // read
    public query func read(id : ID) : async ?Rarity {
      let result = Trie.find(rarities, key(id), eq);
      return result;
    };

     // Test two ids for equality
    private func eq(x : ID, y : ID) : Bool {
        return x == y;
    };

    // Create a trie key from an ID
    private func key(id : ID) : Trie.Key<ID> {
        return { hash = id; key = id };
    };

}