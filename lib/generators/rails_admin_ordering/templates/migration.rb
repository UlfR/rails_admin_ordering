class CreateOrdering < ActiveRecord::Migration
  def self.up

    create_table :orderings do |t|

      t.references :orderable, :polymorphic => true

      t.integer :position

      t.datetime :created_at
    end

    add_index(:orderings, [:orderable_id, :orderable_type, :position], name: 'index_unique_orderings')
  end

  def self.down
    drop_table :orderings
  end
end