package game

import (
	"dragginz-api/dragginz/dsl/entities/game"
	"dragginz-api/dragginz/dsl/templates/entity"
	"dragginz-api/dragginz/dsl/templates/field"
	"dragginz-api/orm/design"
	. "dragginz-api/orm/design/dsl"
)

//
// CHUNK
//
// We use a 3D grid co-ordinate system for Chunk position.  The first Chunk we edit will be (0,0,0).
// Initially we'll constrain these numbers to a fairly narrow range (-10 to +10).
//
// The Z-axis increases the more you travel upwards.  Even though this could mean mostly negative
// numbers we're not too concerned; the co-ordinates aren't used by the Players too often, and also
// we're not sure where we're starting in the world or what size or shape the world will be.
//
// Chunks must always be perfect cubes!
//

func init() {

	Store(game.StoreName, func() {

		//
		// Chunk
		//
		Entity("Chunk", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					A Chunk is a cubic area of game world.  It's the smallest space that can be edited
					at any one time in the World Editor.  This table has one row per grid (x,y,z) represents
					the current version of that Chunk within the World.
				`,
			})

			// Primary
			Field("Chunk", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("X", field.ChunkCoord(), func() {
				Set(design.Field{
					Description: "X Co-ord of Chunk",
				})
			})
			Field("Y", field.ChunkCoord(), func() {
				Set(design.Field{
					Description: "Y Co-ord of Chunk",
				})
			})
			Field("Z", field.ChunkCoord(), func() {
				Set(design.Field{
					Description: "Z Co-ord of Chunk",
				})
			})

			// Relations
			Field("Contents", field.Entity("ChunkContents")) // many to one

			// Indexes
			Index(design.IndexUnique, "X", "Y", "Z")
		})

		//
		// ChunkList
		//
		Entity("ChunkList", entity.Entity(), func() {

			// Primary
			Field("ChunkList", field.ID(), func() {
				PrimaryKey()
			})

			// Relations
			Field("Entries", field.OneToMany("ChunkEntry")) // one to many
		})

		//
		// ChunkEntry
		//
		Entity("ChunkEntry", entity.Join("ChunkList", "Chunk"), func() {
			Interleave("ChunkList")
		})

		//
		// ChunkContents
		//
		Entity("ChunkContents", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					The contents of a Chunk.  We have a Series as the data can be versioned.
					We also keep track of who contributed towards this Chunk.
				`,
			})

			// Primary
			Field("ChunkContents", field.ID(), func() {
				PrimaryKey()
			})

			// Relations
			Field("Data", field.Entity("ChunkData")) // entity
			Field("Zone", field.Entity("Zone"), func() {
				Set(design.Field{
					Description: `
						ZoneID can change over time, so if we store it here we can see how
						the Chunk's Zone has changed over time.
					`,
				})
			})
			Field("Contributor", field.Entity("Contributor"), field.Nullable()) // entity (nullable)
			Field("Series", field.Entity("Series"), field.Nullable())           //
		})

		//
		// ChunkData
		//
		Entity("ChunkData", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					The actual data content of a chunk.  Separated out so it can be referenced
					by multiple places (live game world chunk data, and also build projects)
				`,
			})

			// Primary
			Field("ChunkData", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Metadata", field.JSONB())
			Field("Terrain", field.JSONB())
			Field("TerrainTexture", field.JSONB())
			Field("Format", field.VersionInt(), func() {
				Set(design.Field{
					Description: `
						What version of the data format are we using?
					`,
				})
			})
		})

	})

}
