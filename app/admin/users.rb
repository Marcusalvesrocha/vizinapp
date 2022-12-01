ActiveAdmin.register User do

  #scope_to do
  #  User.where(condo: current_user.condo, admin: true)
  #end

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :user_name
    column :full_name
    column :email
    column :admin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :user_name
  filter :full_name
  filter :email
  filter :admin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user_name
      f.input :full_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
