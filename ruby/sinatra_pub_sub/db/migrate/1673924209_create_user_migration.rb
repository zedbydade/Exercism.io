Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :name, null: false
      String :email, null: false
      String :password, null: false
    end
  end
end
