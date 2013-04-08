ActiveAdmin.register User do
  index do
    column :id
    column :name
    column :oauth_expires_at
    column :created_at
    column :updated_at
    default_actions
  end
end
