import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Types "types"

module {

  // List of Entity Types
  public type Entity = {
    #Ability:             Ability;
    #AbilityGroup:        AbilityGroup;
    #Alignment:           Alignment;
    #Ambience:            Ambience;
    #Animation:           Animation;
    #AreaGuide:           AreaGuide;
    #AssetBundle:         AssetBundle;
    #Atmosphere:          Atmosphere;
    #Biome:               Biome;
    #BuildProject:        BuildProject;
    #BuildSubmission:     BuildSubmission;
    #BuildTask:           BuildTask;
    #BuildTemplate:       BuildTemplate;
    #Character:           Character;
    #CharacterClass:      CharacterClass;
    #Chunk:               Chunk;
    #Climate:             Climate;
    #Collider:            Collider;
    #Concept:             Concept;
    #Cover:               Cover;
    #Culture:             Culture;
    #DensityGuide:        DensityGuide;
    #Element:             Element;
    #Era:                 Era;
    #FrictionGuide:       FrictionGuide;
    #Gender:              Gender;
    #Geology:             Geology;
    #HardnessCategory:    HardnessCategory;
    #HardnessGuide:       HardnessGuide;
    #HeightGuide:         HeightGuide;
    #Icon:                Icon;
    #Item:                Item;
    #LengthGuide:         LengthGuide;
    #MassGuide:           MassGuide;
    #Material:            Material;
    #Mesh:                Mesh;
    #Mob:                 Mob;
    #Model:               Model;
    #OpacityGuide:        OpacityGuide;
    #Pet:                 Pet;
    #PetStage:            PetStage;
    #Player:              Player;
    #Population:          Population;
    #Prop:                Prop;
    #Quality:             Quality;
    #Rarity:              Rarity;
    #Recipe:              Recipe;
    #Release:             Release;
    #ResonanceGuide:      ResonanceGuide;
    #Rig:                 Rig;
    #Role:                Role;
    #Shader:              Shader;
    #SizeCategory:        SizeCategory;
    #Skybox:              Skybox;
    #Sound:               Sound;
    #SoundComponent:      SoundComponent;
    #SoundFile:           SoundFile;
    #SoundLayer:          SoundLayer;
    #SoundLoop:           SoundLoop;
    #SoundVariant:        SoundVariant;
    #Species:             Species;
    #Substance:           Substance;
    #Tag:                 Tag;
    #Team:                Team;
    #TemperatureCategory: TemperatureCategory;
    #TemperatureGuide:    TemperatureGuide;
    #Terrain:             Terrain;
    #Texture:             Texture;
    #TextureAtlas:        TextureAtlas;
    #Theme:               Theme;
    #VelocityGuide:       VelocityGuide;
    #VolumeGuide:         VolumeGuide;
    #Weather:             Weather;
    #Zone:                Zone;
  };

  //
  // Entities
  // These work much the same as rows in a simple SQL table with a single PK
  //

  // @todo, maybe wrap each entity so we can have metadata?
  //public class Ability {
  //  var data = AbilityData;
  //};

  // Ability
  public type AbilityID = Types.ID;
  public type Ability = {
    id:          AbilityID;
    name:        Types.EntityName;
    description: Types.Description;
    icon:        IconID;
  };

  // AbilityGroup
  // a predefined group of abilities
  public type AbilityGroupID = Types.ID;
  public type AbilityGroup = {
    id:          AbilityGroupID;
    name:        Types.EntityName;
    description: Types.Description;
    abilities:   [Ability];
  };

  // Alignment
  public type AlignmentID = Types.ID;
  public type Alignment = {
    id:   AlignmentID;
    name: Text;
  };

  // Ambience
  // A particle effect or sound that can be played within a Zone
  public type AmbienceID = Types.ID;
  public type Ambience = {
    id:           AmbienceID;
    name:         Types.EntityName;
    description:  Types.Description;
    icon:         IconID;
    resource:     Resource;
    status:       Status;
    series:       ?Types.Series; 
    concepts:     [ConceptID];
    tags:         [TagID];
    contributors: [Contributor];
  };

  // Animation
  public type AnimationID = Types.ID;
  public type Animation = {
    id:           AnimationID;
    name:         Types.EntityName;
    rig:          RigID;
    status:       Status;
    series:       ?Types.Series;
    contributors: [Contributor];
  };

  // AreaGuide
  public type AreaGuideID = Types.ID;
  public type AreaGuide = {
    id:          AreaGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    area:        Types.Area;
  };

  // AssetBundle
  public type AssetBundleID = Types.ID;
  public type AssetBundle = {
    id:       AssetBundleID;
    asset:    Types.TODO;
    models:   [ModelID];
    shaders:  [ShaderID];
    sounds:   [SoundID];
    textures: [TextureID];
  };

  // Atmosphere
  public type AtmosphereID = Types.ID;
  public type Atmosphere = {
    id:          AtmosphereID;
    name:        Types.EntityName;
    description: Types.Description;
    icon:        IconID;
    resource:    Resource;
    tags:        [TagID];
    substances:  [SubstanceID];
  };

  // Biome
  // A Biome forms the template for a Zone's Atmosphere, Climate and Geology
  public type BiomeID = Types.ID;
  public type Biome = {
    id:          BiomeID;
    name:        Types.EntityName;
    description: Types.Description;
    icon:        IconID;
    resource:    Resource;
    concepts:    [ConceptID];
    atmosphere:  [AtmosphereID];
    climate:     [ClimateID];
    geology:     [GeologyID];
  };

  // BuildProject
  public type BuildProjectID = Types.ID;
  public type BuildProject = {
    id:          BuildProjectID;
    name:        Types.EntityName;
    description: Types.Description;
    status:      BuildStatus;
    team:        TeamID;
    originChunk: ChunkID;
    chunks:      [{
      offsetX:    Types.ChunkCoord;
      offsetY:    Types.ChunkCoord;
      offsetZ:    Types.ChunkCoord;
      data:       ChunkData;
    }];
  };

  // BuildSubmission
  public type BuildSubmissionID = Types.ID;
  public type BuildSubmission = {
    id: BuildSubmissionID;
  };

  // BuildSubmission
  public type BuildTaskID = Types.ID;
  public type BuildTask = {
    id: BuildTaskID;
  };

  // BuildTemplate
  public type BuildTemplateID = Types.ID;
  public type BuildTemplate = {
    id: BuildTemplateID;
  };

  // Character
  public type CharacterID = Types.ID;
  public type Character = {
    id:        CharacterID;
    name:      Types.EntityName;
    player:    Player;
    gender:    Gender;
    species:   Species;
    inventory: Inventory;
    pets:      [Pet];
    roles:     [Role];
  };

  // CharacterClass
  // @todo I wanted this to be called Class, maybe that name could
  // be within the metadata
  public type CharacterClassID = Types.ID;
  public type CharacterClass = {
    id:       CharacterClassID;
    name:     Types.EntityName;
    icon:     Icon;
    resource: Resource;
    concepts: [ConceptID]; 
  };

  // Chunk
  // A chunk is a 10 metre cubed volume of the game world
  public type ChunkID = Types.ID;
  public type Chunk = {
    id:       ChunkID;
    x:        Types.ChunkCoord;
    y:        Types.ChunkCoord;
    z:        Types.ChunkCoord;
    contents: ChunkData;
  };

  // Climate
  public type ClimateID = Types.ID;
  public type Climate = {
    id:          ClimateID;
    name:        Types.EntityName;
    description: Types.Description;
    resource:    Resource;
    icon:        IconID;
    tags:        [TagID];
    weather:     [WeatherID];
  };

  // Collider
  // A representation of a Collider within Unity
  public type ColliderID       = Types.ID;
  public type Collider = {
    id:            ColliderID;
    isTrigger:     Bool;
    rotation:      Types.Quaternion;
    boxSize:       Types.Vector;
    capsuleLength: ?Types.Distance;
    capsuleRadius: ?Types.Distance; 
    sphereRadius:  ?Types.Distance;
    meshScale:     ?Float;
    axis:          Axis;
    mesh:          MeshID;
  };

  // Concept
  public type ConceptID = Types.ID;
  public type Concept = {
    id:           ConceptID;
    name:         Types.EntityName;
    asset:        Types.TODO;
    status:       Status;
    contributors: [Contributor];
  };

  // Cover
  public type CoverID = Types.ID;
  public type Cover = {
    id:           CoverID;
    name:         Types.EntityName;
    description:  Types.Description;
    icon:         IconID;
    resource:     Resource;
    series:       ?Types.Series;
    contributors: [Contributor];
    concepts:     [ConceptID];
    tags:         [TagID];
  };

  // Culture
  // Culture is a template for a Zone's Population and Themes
  public type CultureID = Types.ID;
  public type Culture = {
    id:           CultureID;
    name:         Types.EntityName;
    description:  Types.Description;
    icon:         IconID;
    resource:     Resource;
    population:   [PopulationID];
    themes:       [ThemeID];
    concepts:     [ConceptID];
    tags:         [TagID];
  };

  // DensityGuide
  public type DensityGuideID = Types.ID;
  public type DensityGuide = {
    id:          DensityGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    density:     Types.Density;
  };

  // Element
  // You can't make a fantasy game without an arbitrary set of elemental powers
  // Earth, Wind, Fire, Air and probably Shadow
  public type ElementID = Types.ID;
  public type Element = {
    id:          ElementID;
    name:        Types.EntityName;
    description: Types.Description;
    icon:        IconID;
  };
  
  // Era
  public type EraID = Types.ID;
  public type Era = {
    id:          EraID;
    name:        Types.EntityName;
    description: Types.Description;
    startYear:   Types.GameYear;
    endYear:     Types.GameYear;
    icon:        IconID;
    resource:    Resource;
  };

  // FrictionGuide
  public type FrictionGuideID = Types.ID;
  public type FrictionGuide = {
    id:          FrictionGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    friction:    Types.Friction;
  };
     
  // Gender
  // An in-game gender, just Male or Female
  public type GenderID = Types.ID;
  public type Gender = {
    id:       GenderID;
    name:     Types.EntityName;
    icon:     IconID;
    resource: Resource;
  };

  // Geology
  public type GeologyID = Types.ID;
  public type Geology = {
    id:          GeologyID;
    name:        Types.EntityName;
    description: Types.Description;
    icon:        IconID;
    resource:    Resource;
    tags:        [TagID];
  };

  // HardnessCategory
  // A category of Hardness, used to group different materials together for game mechanics
  public type HardnessCategoryID = Types.ID;
  public type HardnessCategory = {
    id:          HardnessCategoryID;
    name:        Types.EntityName;
    description: Types.Description;
    minHardness: Types.Hardness;
    maxHardness: Types.Hardness;
    icon:        IconID;
    resource:    Resource;
  };

  // HardnessGuide
  public type HardnessGuideID = Types.ID;
  public type HardnessGuide = {
    id:          HardnessGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    hardness:    Types.Hardness;
  };

  // HeightGuide
  public type HeightGuideID = Types.ID;
  public type HeightGuide = {
    id:          HeightGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    height:      Types.Distance;
  };

  // Icon
  // A 240x240 PNG image used to represent basically anything in-game.  Will be used on the website,
  // client, and freely available to Players to use as memes.
  public type IconID = Types.ID;
  public type Icon = {
    id:           IconID;
    name:         Types.EntityName;
    status:       Status;
    series:       ?Types.Series;
    contributors: [Contributor];
  };

  // Item
  // The definition of an Item, not the in-game instance of that Item
  public type ItemID = Types.ID;
  public type Item = {
    id:       ItemID;
    name:     Types.EntityName;
    icon:     IconID;
    rarity:   RarityID;
    quality:  QualityID;
    resource: Resource;
    eatAction: ?{
      foodBonus: Types.TODO;
    };
    wearAction: ?{
    };
    abilities: [{
      ability:  AbilityID;
      cooldown: Cooldown;
      charges:  [RNG];
    }];
    concepts: [ConceptID];
  };

  // LengthGuide
  public type LengthGuideID = Types.ID;
  public type LengthGuide = {
    id:          LengthGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    length:      Types.Distance;
  };

  // MassGuide
  public type MassGuideID = Types.ID;
  public type MassGuide = {
    id:          MassGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    mass:        Types.Mass;
  };

  // Material
  public type MaterialID = Types.ID;
  public type Material = {
    id:       MaterialID;
    name:     Types.EntityName;
    colour:   Types.Colour;
    status:   Status;
    mesh:     ?MeshID;
    series:   ?Types.Series;
    textures: [TextureID];
  };

  // Mesh
  // A representation of a Mesh as defined by Unity
  public type MeshID = Types.ID;
  public type Mesh = {
    id:        MeshID;
    model:     ModelID;
    status:    Status;
    series:    ?Types.Series;
    materials: [MaterialID];
  };

  // Mob
  // MObile Object.  This includes NPCs and Monsters
  public type MobID = Types.ID;
  public type Mob = {
    id:       MobID;
    name:     Types.EntityName;
    icon:     IconID;
    concepts: [ConceptID];
  };

  // Model
  // The representation of a 3D Model as defined by Unity
  public type ModelID = Types.ID;
  public type Model = {
    id:          ModelID;
    name:        Types.EntityName;
    description: Types.Description;
    lodLevels:   Nat;   // 1 to 10
    volume:      ?Types.Volume;
    contributor: Contributor;
    meshes:      [MeshID];
  };

  // Object
  // stores the attributes of anything that is represented in game as
  // @todo - need a better name
  public type ObjectID = Types.ID;
  public type Object = {

  };

  // OpacityGuide
  public type OpacityGuideID = Types.ID;
  public type OpacityGuide = {
    id:          OpacityGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    opacity:     Types.Opacity;
  };

  // Pet
  // the Template for a Pet, not the instance of it existing within the game
  public type PetID = Types.ID;
  public type Pet = {
    id:        PetID;
    name:      Types.EntityName;
    character: CharacterID;
    species:   SpeciesID;
    gender:    Gender;
  };

  // PetStage
  public type PetStageID = Types.ID;
  public type PetStage = {
    id:             PetStageID;
    name:           Types.EntityName;
    description:    Types.Description;
    rank:           Types.Rank;
    baseLevel:      Types.Level;
    progressLevels: Nat;   // 1 to 20
    resource:       Resource;
    costs:          [Cost];
    requirements:   [Requirement];
    restrictions:   [Restriction];
  };

  // Player
  // A person who plays the game.  Preferably one Player account per person - we'll
  // try not to incentivise the creation of multiple accounts
  public type PlayerID = Types.ID;
  public type Player = {
    id:   PlayerID;
    name: Types.EntityName;
  };

  // Population
  // A Zone can have many Populations
  public type PopulationID = Types.ID;
  public type Population = {
    id:           PopulationID;
    name:         Types.EntityName;
    description:  Types.Description;
    icon:         IconID;
    resource:     Resource;
    tags:         [TagID];
    demographics: [{
      weighting: Types.Weighting;
      species:   SpeciesID;
      gender:    ?GenderID;
    }];
  };

  // Prop
  public type PropID = Types.ID;
  public type Prop = {
    id:       PropID;
    name:     Types.EntityName;
    resource: Resource;
  };
  
  // Quality
  // The level of craftsmanship that an Item or Prop possesses.  Higher qualities increase the
  // value of an Item when sold, and can affect the loot rolls when an Item or Prop is broken down.
  public type QualityID = Types.ID;
  public type Quality = {
    id:              QualityID;
    name:            Types.EntityName;
    icon:            IconID; 
    resource:        Resource;
    valueMultiplier: Nat;
  };

  // Rarity
  // There are seven levels of Rarity 
  public type RarityID = Types.ID;
  public type Rarity = {
    id:              RarityID;
    name:            Types.EntityName;
    icon:            IconID;
    resource:        Resource;
    weighting:       Types.Weighting;
    valueMultiplier: Nat;
  };

  // Recipe
  public type RecipeID = Types.ID;
  public type Recipe = {
    id:           RecipeID;
    name:         Types.EntityName;
    description:  Types.Description;
    resource:     Resource;
    costs:        [Cost];
    requirements: [Requirement];
    restrictions: [Restriction];
    rewards:      [Reward]
  };

  // Release
  // A scheduled content release
  public type ReleaseID = Types.ID;
  public type Release = {
    id:          ReleaseID;
    name:        Types.EntityName;
    description: Types.Description;
    startTime:   Types.TODO;
    icon:        IconID;
  };

  // ResonanceGuide
  public type ResonanceGuideID = Types.ID;
  public type ResonanceGuide = {
    id:          ResonanceGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    resonance:   Types.Resonance;
  };

  // Rig
  // A Rig as specified by Unity
  public type RigID = Types.ID;
  public type Rig = {
    id:           RigID;
    name:         Types.EntityName;
    series:       ?Types.Series;
    status:       Status;
    animations:   [AnimationID];
    contributors: [Contributor];
  };

  // Role
  public type RoleID = Types.ID;
  public type Role = {
    id:             RoleID;
    name:           Types.EntityName;
    description:    Types.Description;
    characterClass: CharacterClass;
    baseLevel:      Nat;
    progressLevels: Nat;  // 1 to 20
    icon:           Icon;
    resource:       Resource;
    abilityGroups:  [AbilityGroup];
    concepts:       [ConceptID];
    costs:          [Cost];
    requirements:   [Requirement];
    restrictions:   [Restriction];
  };

  // Shader
  // i tried to combine two entities here, not sure if that's a good idea or even
  // if it comes close to working
  // THIS IS A TEST!!!
  public type ShaderID = Types.ID;
  public type Shader = {
    #external: {
      id:           ShaderID; 
      asset:        Types.TODO;
      status:       Status;
      contributors: [Contributor];
      series:       ?Types.Series;
    };
    #internal: {
      id:         ShaderID; 
      name:       Types.EntityName;
      unityClass: Types.UnityClass;
    };
  };

  // SizeCategory
  // Grouping objects by their size, so for instance, a sword may have a bonus against large creatures
  public type SizeCategoryID = Types.ID;
  public type SizeCategory = {
    id:          SizeCategoryID;
    name:        Types.EntityName;
    description: Types.Description;
    minSize:     Types.Distance;
    maxSize:     Types.Distance;
    icon:        IconID;
    resource:    Resource;
  };

  // Skybox
  // The representation of a Unity Skybox
  public type SkyboxID = Types.ID;
  public type Skybox = {
    id:          SkyboxID;
    name:        Types.EntityName;
    description: Types.Description;
    asset:       Types.TODO;
  };

  // Sound
  public type SoundID = Types.ID;
  public type Sound = {
    id:     SoundID;
    name:   Types.EntityName;
    status: Status;
    series: ?Types.Series;
    layers: [SoundLayer];
  };

  // SoundComponent
  public type SoundComponentID = Types.ID;
  public type SoundComponent = {
    id:         SoundComponentID;
    isRandom:   Bool;
    isRepeated: Bool;
    variants:   [SoundVariant];
  };

  // SoundFile
  public type SoundFileID = Types.ID;
  public type SoundFile = {
    id:         SoundFileID;
    name:       Types.EntityName;
    length:     Types.Interval;
    lufs:       Int;  // -99 to 99
    sampleRate: Int;  // readonly?
    asset:      Types.TODO;
    channel:    SoundChannel;
  };

  // SoundLayer
  // describes a complete single layer within a sound effect (layers also implement audio LOD)
  public type SoundLayerID = Types.ID;
  public type SoundLayer = {
    id:          SoundLayerID;
    name:        Types.EntityName;
    delay:       Types.TODO;
    level:       Types.TODO;
    minDistance: Nat;  // 0 to 10
    maxDistance: Nat;  // 0 to 10
    components:  [SoundComponentID];
  };

  // SoundLoop
  public type SoundLoopID = Types.ID;
  public type SoundLoop = {
    id:            SoundLoopID;
    startPos:      Types.Interval;
    endPos:        Types.Interval;
    crossfadeTime: Types.Interval;
    restartDelay:  Types.Interval;
    repeatTime:    ?Types.Interval;
    bounce:        Bool;
    reverse:       Bool;
  };

  // SoundVariant
  public type SoundVariantID = Types.ID;
  public type SoundVariant = {
    id:           SoundVariantID;
    name:         Types.EntityName;
    playbackRate: Types.TODO;
    bypassReverb: Bool;
    file:         [SoundFileID];
    soundLoop:    ?SoundLoop;
  };

  // Species
  // TREE STRUCTURE @todo
  public type SpeciesID = Types.ID;
  public type Species = {
    id:   SpeciesID;
    name: Types.EntityName;
  };

  // Substance
  // The basic material that something is made from.  We'd mostly stick with things like Air, Water and
  // not break them down into elements, which in most cases would be overly complex
  // @todo Tree structure
  public type SubstanceID = Types.ID;
  public type Substance = {
    id:          SubstanceID;
    name:        Types.EntityName;
    description: Types.Description;
    density:     Types.Density;
    hardness:    Types.Hardness;
    friction:    Types.Friction;
    resource:    Resource;
  };

  // Tag
  // a list of generic string tags that are used to describe zones in different ways
  public type TagID = Types.ID;
  public type Tag = {
    id:          TagID;
    name:        Types.EntityName;
    description: Types.Description;
  };

  // Team
  // A team is a group of players and a name, much the same as a Guild in WoW but can be
  // used in a more ephemeral way, such as grouping together people temporarily to work
  // on a Zone
  public type TeamID = Types.ID;
  public type Team = {
    id:       TeamID;
    name:     Types.EntityName;
    players:  [Player];
  };

  // TemperatureCategory
  // grouping objects into temperature ranges
  public type TemperatureCategoryID = Types.ID;
  public type TemperatureCategory = {
    id:          TemperatureCategoryID;
    name:        Types.EntityName;
    description: Types.Description;
    minTemp:     Types.Temperature;
    maxTemp:     Types.Temperature;
    icon:        IconID;
    resource:    Resource;
  };

  // TemperatureGuide
  public type TemperatureGuideID = Types.ID;
  public type TemperatureGuide = {
    id:          TemperatureGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    temperature: Types.Temperature;
  };

  // Terrain
  public type TerrainID = Types.ID;
  public type Terrain = {
    id:          TerrainID;
    name:        Types.EntityName;
    description: Types.Description;
    resonance:   Types.Resonance;
    icon:        IconID;
    material:    MaterialID;
    resource:    Resource;
    composition: [SubstanceID];
  };

  // Texture
  public type TextureID = Types.ID;
  public type Texture = {
    id:           TextureID;
    name:         Types.EntityName;
    asset:        Types.TODO;
    status:       Status;
    textureType:  TextureType;
    material:     ?MaterialID;
    series:       ?Types.Series;
    contributors: [Contributor];
  };

  // TextureAtlas
  // A single PNG image containing many other PNG images tiled together, as per Unity
  public type TextureAtlasID = Types.ID;
  public type TextureAtlas = {
    id:       TextureAtlasID;
    asset:    Types.TODO;
    textures: [TextureID]
  };

  // Theme
  public type ThemeID = Types.ID;
  public type Theme = {
    id:           ThemeID;
    name:         Types.EntityName;
    description:  Types.Description;
    icon:         IconID;
    resource:     Resource;
    tags:         [TagID];
  };

  // VelocityGuide
  public type VelocityGuideID = Types.ID;
  public type VelocityGuide = {
    id:          VelocityGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    velocity:    Types.Velocity;
  };

  // VolumeGuide
  public type VolumeGuideID = Types.ID;
  public type VolumeGuide = {
    id:          VolumeGuideID;
    name:        Types.EntityName;
    description: Types.Description;
    volume:      Types.Volume;
  };

  // Weather
  public type WeatherID = Types.ID;
  public type Weather = {
    id:          WeatherID;
    name:        Types.EntityName;
    description: Types.Description;
    icon:        IconID;
    resource:    Resource;
  };


  // Zone
  // our game world is divided into a tree of Zones
  // if a Zone is removed, don't repurpose just set isRetired to true
  public type ZoneID = Types.ID;
  public type Zone = {

    // Fields
    id:                ZoneID;
    name:              Types.EntityName;
    description:       Types.Description;
    isVirtual:         Bool;    // is this zone physically within the game world?
    isRetired:         Bool;    // has this zone been retired    

    // Inheritance Fields
    inheritAtmosphere: Bool;
    inheritCliamte:    Bool;
    inheritGeology:    Bool;
    inheritPopulation: Bool;
    inheritTheme:      Bool;

    // Relations
    biome:             ?BiomeID;
    culture:           ?CultureID;
    concepts:          [ConceptID];
    resource:          Resource;

    // Relations - Classification
    atmosphere:        [AtmosphereID];
    climate:           [ClimateID];
    geology:           [GeologyID];
    population:        [PopulationID];
    theme:             [Theme];
  };

  //
  // Data Structures
  // reuseable components for the data model
  //
  //

  // ChunkData
  public type ChunkData = {
    stuff: Text;
  };
  
  // Cooldown
  public type Cooldown = {
    interval: Types.TODO;
    uses:     Nat;  // 1 to 20
    rolling:  Bool;
  };

  // Contributor
  public type Contributor = {
    teams:   [TeamID];
    players: [PlayerID];
  };

  // Cost
  public type Cost = {
    currency:  Nat;
  };

  // ItemInstance
  // @todo need a better naming convention
  public type ItemInstance = {
    name: Types.EntityName;
    item: ItemID;
  };

  // Inventory
  public type Inventory = {
    items: [InventoryItem];
  };

  // InventoryItem
  public type InventoryItem = {
    item:     Item;
    quantity: Nat;
    order:    Nat;
  };

  // MobInstance
  // @todo need a better naming convention
  public type MobInstance = {
    name: Types.EntityName;
    mob:  MobID;
  };

  // PropInstance
  // @todo need a better naming convention
  public type PropInstance = {
    name:   Types.EntityName;
    prop:   PropID;
  };

  // Requirement
  public type Requirement = {
    character: [RequirementCharacter];
    pet:       [RequirementPet];
    player:    [RequirementPlayer];
  };

  // RequirementCharacter
  // The subset of requirements that correspond to the current Character
  public type RequirementCharacter = {
    classes:  [CharacterClassID];
    roles:    [RoleID];
    species:  [SpeciesID];
  };

  // RequirementPet
  // The subset of requirements that correspond to a Character's active Pet
  public type RequirementPet = {
    elements: [Element];
    species:  [SpeciesID];
  };

  // RequirementPlayer
  // The subset of requirements that correspond to the current Player
  public type RequirementPlayer = {
  };

  // Resource
  public type Resource = {
    secret: Types.UUID;
  };

  // Restriction
  public type Restriction = {
    character: [RestrictionCharacter];
    pet:       [RestrictionPet];
    player:    [RestrictionPlayer];
  };

  // RestrictionCharacter
  public type RestrictionCharacter = {
    classes:  [CharacterClassID];
    roles:    [RoleID];
    species:  [SpeciesID];
  };

  // RestrictionPet
  public type RestrictionPet = {
    elements: [Element];
    species:  [SpeciesID];
  };

  // RestrictionPlayer
  public type RestrictionPlayer = {
  };

  // Reward
  public type Reward = {
    currency: Nat;
    items:    [ItemID];
  };

  // RNG
  // A single dice-based random number generator.  Multiple RNGs can be combined together
  // using addition
  public type RNG = {
    chance:     Types.Percent;
    dice:       Nat;
    faces:      Nat;
    dropHigh:   Nat;
    dropLow:    Nat;
    modifier:   Int;
    multiplier: Int;
  };

  // Status
  // Fields that collectively say whether or not an Entity is actually "live" within the game
  public type Status = {
    isLive:       Bool;
    killWithFire: Bool;
    startTime:    Types.TODO;
    endTime:      Types.TODO;
    startRelease: ?ReleaseID;
    endRelease:   ?ReleaseID;
  };

  //
  // Enums
  //

  // Axis
  // A designator for a cartesian coordinate system, optimised for a four-dimensional manifold
  // with three dimensions of space, but ignoring relativistic effects
  public type Axis = {
    #x:  Text;
    #y:  Text;
    #z:  Text;
  };

  // BuildStatus
  // a list of status codes used by BuildStatus
  public type BuildStatus = {
    #approved: Text;
  };

  // SoundChannel
  public type SoundChannel = {
    #twodotone:  Text;
    #fivedotone: Text;
  };

  // TextureType
  // These correspond with the types of Texture found within Unity
  public type TextureType = {
    #albedo:   Text;
    #normal:   Text;
    #specular: Text;
  }


};
 
