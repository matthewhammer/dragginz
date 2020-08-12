package game

import (
	"dragginz-api/dragginz/behaviours/api"
	"dragginz-api/dragginz/dsl/entities/game"
	"dragginz-api/dragginz/dsl/templates/entity"
	"dragginz-api/dragginz/dsl/templates/field"
	"dragginz-api/orm/design"
	. "dragginz-api/orm/design/dsl"
)

func init() {

	Store(game.StoreName, func() {

		//
		// Population
		//
		Entity("Population", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					A Zone can have multiple Populations.
				`,
			})

			// Primary
			Field("Population", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description(), func() {
				Set(design.Field{
					Description: `
						The description field should explain the dynamics of the
						population, why they are mixed that way and how they interact.
					`,
				})
			})

			// Relations
			Field("Icon", field.Entity("Icon"))                             // entity
			Field("Resource", field.Entity("Resource"))                     //
			Field("Tags", field.EntityList("TagList"), field.Nullable())    // entity list (nullable)
			Field("Demographics", field.OneToMany("PopulationDemographic")) // one to many

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

		//
		// PopulationDemographic
		//
		Entity("PopulationDemographic", entity.Entity(), func() {

			// Primary
			Field("Population", field.ManyToOne("Population"))
			Field("PopulationDemographic", field.ID())
			PrimaryKey("Population", "PopulationDemographic")
			Interleave("Population")

			// Fields
			Field("Weighting", field.Weighting())

			// Relations
			Field("Species", field.Entity("Species"))                 // entity
			Field("Gender", field.Entity("Gender"), field.Nullable()) // entity (nullable)
		})

	})

}
