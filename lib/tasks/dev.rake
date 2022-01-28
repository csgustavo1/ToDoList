namespace :dev do

   DEFAULT_PASSWORD = 123456


  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
     show_spinner("Apagando BD...") { %x(rails db:drop) }
     show_spinner("Criando BD...") { %x(rails db:create) }
     show_spinner("Migrando BD...") { %x(rails db:migrate) }
     show_spinner("Criando user") { %x(rails dev:add_default_user) }
    else
     puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
     email: 'gustavohj039@gmail.com',
     password: DEFAULT_PASSWORD,
     password_confirmation: DEFAULT_PASSWORD
    )
  end

 
  private
   def show_spinner(msg_start, msg_end = "Concluído!")
     spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
     spinner.auto_spin
     yield
     spinner.success("(#{msg_end})")
    end
  end   