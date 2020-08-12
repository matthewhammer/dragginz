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
		// Substance
		//
		Entity("Substance", entity.Entity(), func() {

			// Primary
			Field("Substance", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Fields (Physics)
			Field("Density", field.Density())
			Field("Hardness", field.Hardness())
			Field("Friction", field.Friction())

			// Relations
			Field("RawMaterial", field.Entity("ItemT"))    // entity
			Field("Resource", field.Entity("Resource"))    //
			Field("State", field.Entity("SubstanceState")) //

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

		//
		// SubstanceState
		//
		Entity("SubstanceState", entity.Entity(), func() {

			// Primary
			Field("SubstanceState", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))         // entity
			Field("Resource", field.Entity("Resource")) //

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

	})

}
