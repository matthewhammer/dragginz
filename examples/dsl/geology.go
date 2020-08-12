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
		// Geology
		//
		Entity("Geology", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					Zones can have multiple Geologies, each one uses the tag system
					to say which Placeables should be used.
				`,
			})

			// Primary
			Field("Geology", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))         // entity
			Field("Resource", field.Entity("Resource")) //
			Field("Tags", field.EntityList("TagList"), field.Nullable())     // entity list (nullable)

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

	})

}
