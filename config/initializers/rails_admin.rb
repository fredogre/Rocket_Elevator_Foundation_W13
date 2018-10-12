RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==

  

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.model 'BuildingDetail' do
    exclude_fields :created_at, :updated_at
    parent Building
    weight -1
  end

  config.model 'Address' do
    weight -5
  end

  config.model 'Customer' do
    weight -4
  end

  config.model 'Building' do
    weight -3
  end

  config.model 'Lead' do
    weight -2
  end

  config.model 'Quote' do
    weight -1
  end

  config.model 'Battery' do
    parent Building
  end

  config.model 'Column' do
    parent Battery
  end

  config.model 'Elevator' do
    parent Column
  end

  config.model 'Contact' do
    parent Quote
  end

   #config.label_methods << :name
   #config.label_methods << :address
   #config.label_methods << :user
   #config.label_methods << :Customer

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
