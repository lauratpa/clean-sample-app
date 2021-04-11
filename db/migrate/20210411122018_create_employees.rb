# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :employees do
      primary_key :id
      column :name, String

      column :created_at, :datetime, null: false
      column :updated_at, :datetime, null: false
    end
  end
end
