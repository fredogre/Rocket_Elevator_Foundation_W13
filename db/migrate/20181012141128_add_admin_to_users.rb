class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
  end
  if current_user.admin?
    authenticate :user, ->(user) { user.admin? } do
      mount Blazer::Engine, at: "blazer"
  
  end
end 