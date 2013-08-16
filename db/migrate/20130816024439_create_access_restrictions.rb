class CreateAccessRestrictions < ActiveRecord::Migration
  def change
    create_table :access_restrictions do |t|
      t.integer :post_id
      t.boolean :to_members_only
      t.boolean :to_all

      t.timestamps
    end
  end
end
