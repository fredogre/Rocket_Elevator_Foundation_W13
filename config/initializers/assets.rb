# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

#Rails.application.config.assets.precompile += %w( header-1.css )
#Rails.application.config.assets.precompile += %w( color_scheme/darkblue.css )
#Rails.application.config.assets.precompile += %w( guillaume.css )
#Rails.application.config.assets.precompile += %w( css/layout.css )
#Rails.application.config.assets.precompile += %w( css/essentials.css )
#Rails.application.config.assets.precompile += %w( guillaume.css )
#Rails.application.config.assets.precompile += %w( script_guillaume.js )
#Rails.application.config.assets.precompile += %w( https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js )
#Rails.application.config.assets.precompile += %w( https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js )
#Rails.application.config.assets.precompile += %w( https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js )
#Rails.application.config.assets.precompile += %w( https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css )

#Rails.application.config.assets.precompile += %w( plugins/slider.revolution/css/settings.css )
#Rails.application.config.assets.precompile += %w( plugins/slider.revolution/css/extralayers.css )
#Rails.application.config.assets.precompile += %w( plugins/bootstrap/css/bootstrap.min.css )




# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
