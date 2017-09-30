namespace :dev do

  desc "Rebuild system"
  task :rebuild => ["db:drop","db:setup", :admin_fake]

  task :admin_fake => :environment do
    # admin@admin.com
    puts('create admin')

    user = User.create(
      last_name: "admin",
      first_name: "fake",
      email: "admin@admin.com",
      password: 12345678,
      confirmed_at: DateTime.now,
    )

    user.add_role :admin
  end

end