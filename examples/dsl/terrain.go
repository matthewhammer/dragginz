package game

import (
	"dragginz-api/dragginz/behaviours/api"
	"dragginz-api/dragginz/dsl/entities/game"
	"dragginz-api/dragginz/dsl/templates/entity"
	"dragginz-api/dragginz/dsl/templates/field"
	. "dragginz-api/orm/design/dsl"
)

func init() {

	Store(game.StoreName, func() {

		//
		// Terrain
		//
		Entity("Terrain", entity.Entity(), func() {

			// Primary
			Field("Terrain", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())
			Field("Resonance", field.ResonanceGuide())

			// Relations
			Field("Icon", field.Entity("Icon"))                                  // entity
			Field("Resource", field.Entity("Resource"))                          //
			Field("Contributor", field.Entity("Contributor"), field.Nullable())  // entity (nullable)
			Field("Series", field.Entity("Series"), field.Nullable())            //
			Field("Concepts", field.EntityList("ConceptList"), field.Nullable()) // entity list (nullable)
			Field("Tags", field.EntityList("TagList"), field.Nullable())         //
			Field("Materials", field.ManyToMany("TerrainXMaterial"))             // many to many
			Field("Substances", field.ManyToMany("TerrainXSubstance"))           //

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Icon", "Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

		// Entity Templates
		Entity("TerrainXMaterial", entity.Join("Terrain", "Material"), func() {
			Field("Weighting", field.Weighting())
		})
		Entity("TerrainXSubstance", entity.Join("Terrain", "Substance"), func() {
			Field("Weighting", field.Weighting())
		})

	})

}
