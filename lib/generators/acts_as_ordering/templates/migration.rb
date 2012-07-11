class CreateTaggables < ActiveRecord::Migration
  def self.up

    create_table :ordering do |t|

      t.references :orderable, :polymorphic => true

      t.integer :position

      t.datetime :created_at
    end

    add_index :ordering, [:orderable_id, :orderable_type, :position]
  end

  def self.down
    drop_table :ordering
  end
end